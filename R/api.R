get_benchling <- function(endpoint, org = get_org(), ...) {
  endpoint <- utils::URLencode(endpoint)
  query <- list(...)
  if (length(query)) {
    query <- as.list(stats::setNames(utils::URLencode(query), names(query)))
  }
  url <- glue::glue("https://{org}.benchling.com/api/v2/")
  resp <- httr::GET(
    url = glue::glue("{url}/{endpoint}"),
    query = query,
    httr::authenticate(get_token(), "")
  )
  if (!(sc <- httr::status_code(resp)) == 200L) {
    warning("** Request returned status ", sc, call. = FALSE)
    return(invisible(resp))
  }
  ep <- if (grepl("/", endpoint)) {
    sub("/.*", "", endpoint)
  } else {
    endpoint
  }
  cont <- jsonlite::fromJSON(httr::content(resp, as = "text", encoding = "UTF-8"))
  if (utils::hasName(cont, ep)) {
    cont[[ep]]
  } else if (utils::hasName(cont, camel_ep <- camel(ep))) {
    cont[[camel_ep]]
  } else {
    cont
  }
}

camel <- function(x) {
  gsub("(\\w)-(\\w)", "\\1\\U\\2", x, perl = T)
}

#' Fetch API Specification
#'
#' @md
#' @param org benchling tenant. Use empty string (`org = ""`) to use the public
#'   API spec \url{https://benchling.com/api/v2/openapi.yaml}
#'
#' @return API spec as a nested list
#' @export
get_api_yaml <- function(org = get_org()) {
  org <- ifelse(org == "", "", paste0(org, "."))
  if (org == "") {
    return(yaml::read_yaml("https://benchling.com/api/v2/openapi.yaml"))
  }
  url <- glue::glue("https://{org}benchling.com/api/v2/openapi.yaml")
  message("Fetching API spec from ", url)
  resp <- httr::GET(url, httr::authenticate(get_token(), ""))
  if (!(sc <- httr::status_code(resp)) == 200L) {
    warning("** Request returned status ", sc, call. = FALSE)
    return(invisible(resp))
  }
  yaml <- httr::content(resp, as = "text", encoding = "UTF-8")
  yaml::read_yaml(text = yaml)
}

post_benchling <- function(endpoint, body = NULL, org = get_org(), ...) {
  stopifnot(!is.null(body))
  url <- glue::glue("https://{org}.benchling.com/api/v2/")
  resp <- httr::POST(
    url = glue::glue("{url}/{endpoint}"),
    body = jsonlite::toJSON(body, auto_unbox = TRUE),
    encode = "json",
    httr::authenticate(get_token(), "")
  )
  if (!(sc <- httr::status_code(resp)) == 201L) {
    warning("** Request returned status ", sc, call. = FALSE)
    return(invisible(resp))
  }
  jsonlite::fromJSON(httr::content(resp, as = "text", encoding = "UTF-8"))
}
