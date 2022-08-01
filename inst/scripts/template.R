template_param <- "
#' {title}
#'
#' {description}
#'
#' @param {ep_id} {ep} id
#'
#' @return data from {ep} endpoint
#' @export
#'
#' @rdname {ep}
get_{ep} <- function({ep_id} = NULL) {{
  endpoint <- \"{ep}\"
  if (!is.null({ep_id})) {{
    endpoint <- glue::glue(\"{ep}/{{{ep_id}}}\")
  }}
  get_benchling(endpoint)
}}


"

template_noparam <- "
#' {title}
#'
#' {description}
#'
#' @return data from {ep} endpoint
#' @export
#'
#' @rdname {ep}
get_{ep} <- function() {{
  get_benchling({ep})
}}


"

api <- yaml::read_yaml("https://benchling.com/api/v2/openapi.yaml")
endpoints <- data.frame(endpoints = sub("^/", "", names(api$paths)))
x <- tidyr::separate(endpoints, endpoints, into = c("ep", "param1", "param2", "param3"), sep = "/")
x <- tidyr::separate(x, ep, into = c("ep", "action"), sep = ":")
args <- tidyr::nest(x, args = -ep)

titles <- purrr::discard(purrr::map(api$paths, c("get", "summary")), is.null)
names(titles) <- sub("^/", "", names(titles))
titles <- tibble::enframe(titles) |> tidyr::unnest(value)
title_tags <- purrr::discard(purrr::map(api$paths, c("get", "tags")), is.null)
names(title_tags) <- sub("^/", "", names(title_tags))
title_tags <- tibble::enframe(title_tags) |> tidyr::unnest(value)
title_tags <- dplyr::filter(title_tags, !name %in% grep("[/:]", title_tags$name, value = TRUE))

descriptions <- purrr::map_dfr(api$tags, ~tibble::tibble(value = .x[[2]], description = .x[[1]])) |>
  dplyr::left_join(title_tags, by = "value")
descriptions$description <- gsub("\\n", "", descriptions$description)

get_template_data <- function(class) {
  title <- dplyr::filter(titles, name == class) |> dplyr::pull(value)
  description <- dplyr::filter(descriptions, name == class) |> dplyr::pull(description)
  args <- dplyr::filter(args, ep == class) |> tidyr::unnest(args)
  param <- dplyr::filter(args, !is.na(param1)) |> dplyr::pull(param1)
  param <- gsub("[}{]", "", param)
  param <- param[!grepl("[:/]", param)]
  param <- gsub("-", "_", param)
  class <- gsub("-", "_", class)
  list(ep = class, title = title, description = description, args = args, ep_id = param)
}

fill_template <- function(class) {
  d <- get_template_data(class)
  if (!is.null(d$ep_id)) {
    glue::glue_data(d, template_param)
  } else {
    glue::glue_data(d, template_noparam)
  }
}

write_template <- function(class) {
  cat(fill_template(class), file = here::here("R", paste0(class, ".R")))
}

for (e in args$ep) {
  write_template(e)
}

styler::style_dir(here::here("R"))
