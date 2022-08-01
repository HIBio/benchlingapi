get_benchling <- function(endpoint, org = Sys.getenv("BENCHLING_ORG"), ...) {
  query <- list(...)
  url <- glue::glue("https://{org}.benchling.com/api/v2/")
  resp <- httr::GET(
    url = glue::glue("{url}/{endpoint}"),
    query = query,
    httr::authenticate(Sys.getenv("BENCHLING_TOKEN"), "")
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
  }
}

camel <- function(x) {
  gsub('(\\w)-(\\w)', '\\1\\U\\2', x, perl=T)
}
