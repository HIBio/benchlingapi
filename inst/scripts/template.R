template_param <- "
#' {title}
#'
#' {description}
#'
#' @param {ep_id} {ep} id
#' {param_desc}
#' @return data from `{fun}` endpoint
#' @export
#'
#' @rdname {fun}
get_{fun} <- function({ep_id} = NULL, ...) {{
  endpoint <- \"{ep}\"
  if (!is.null({ep_id})) {{
    endpoint <- glue::glue(\"{ep}/{{{ep_id}}}\")
  }}
  get_benchling(endpoint, query = ...)
}}

"

template_noparam <- "
#' {title}
#'
#' {description}
#'
#' @return data from `{fun}` endpoint
#' @export
#'
#' @rdname {fun}
get_{fun} <- function() {{
  get_benchling({ep})
}}

"


api <- get_api_yaml()
endpoints <- data.frame(endpoints = sub("^/", "", names(api$paths)))
x <- tidyr::separate(endpoints, endpoints, into = c("ep", "param1", "param2", "param3"), sep = "/")
x <- tidyr::separate(x, ep, into = c("ep", "action"), sep = ":")
x <- dplyr::mutate(x, direct = is.na(param1))
args <- tidyr::nest(x, args = -ep)

titles <- purrr::discard(purrr::map(api$paths, c("get", "summary")), is.null)
names(titles) <- sub("^/", "", names(titles))
titles <- tibble::enframe(titles) |> tidyr::unnest(value)
title_tags <- purrr::discard(purrr::map(api$paths, c("get", "tags")), is.null)
names(title_tags) <- sub("^/", "", names(title_tags))
title_tags <- tibble::enframe(title_tags) |> tidyr::unnest(value)
title_tags$name <- sub("/.*$", "", title_tags$name)
title_tags <- unique(title_tags)
title_tags <- dplyr::filter(title_tags, !name %in% grep("[/:]", title_tags$name, value = TRUE))

descriptions <- purrr::map_dfr(api$tags, ~tibble::tibble(value = .x[[2]], description = .x[[1]])) |>
  dplyr::left_join(title_tags, by = "value")
descriptions$description <- gsub("\\n", "", descriptions$description)

get_template_data <- function(class) {
  title <- dplyr::filter(titles, name == class) |> dplyr::pull(value)
  description <- dplyr::filter(descriptions, name == class) |> dplyr::pull(description)
  description <- paste(strwrap(description, width = 80), collapse = "\n#' ")
  if (length(title) == 0) title <- dplyr::filter(descriptions, name == class) |> dplyr::pull(value)
  args <- dplyr::filter(args, ep == class) |> tidyr::unnest(args)

  param <- dplyr::filter(args, !is.na(param1)) |> dplyr::pull(param1)
  param <- gsub("[}{]", "", param)
  param <- unique(param[!grepl("[:/]", param)])
  param <- gsub("-", "_", param)

  fun <- gsub("-", "_", class)
  class <- gsub("_", "-", class)

  res <- list(
    fun = fun,
    ep = class,
    title = title,
    description = description,
    args = args,
    ep_id = param
  )

  orig_class <- paste0("/", class)
  if (nrow(args) > 0L && any(args$direct) && !is.null(x <- api$paths[[orig_class]]$get$parameters)) {
    param_desc <- purrr::map_dfr(
      x,
      ~tibble::tibble(name = .$name, description = gsub("\\n", "", .$description))
    )
    param_desc <- paste0("@param ... additional query parameters; see Details below\n#'\n#' @details\n#' Available query parameters:\n#' \\describe{\n#'    ",
                         paste(glue::glue_data(
                           param_desc,
                           "\\item{{{name}}}{{{description}}}\n"),
                           collapse = "\n#'    "),
                         "\n#' }\n#' ")
  } else {
    param_desc <- "@param ... (ignored)\n#' "
  }
  res <- c(res, param_desc = param_desc)

  res
}

fill_template <- function(class) {
  d <- get_template_data(class)
  if (length(d$ep_id) > 0 && !is.null(d$ep_id)) {
    glue::glue_data(d, template_param)
  } else {
    glue::glue_data(d, template_noparam)
  }
}

write_template <- function(class) {
  cat(fill_template(class), file = here::here("R", paste0("auto_", class, ".R")))
}

for (e in args$ep) {
  cat("*** processing ", e, "\n")
  write_template(e)
}

styler::style_dir(here::here("R"))
