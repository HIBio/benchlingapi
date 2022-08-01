get_benchling <- function(endpoint, org = Sys.getenv("BENCHLING_ORG")) {
  url <- glue::glue("https://{org}.benchling.com/api/v2/")
  resp <- httr::GET(
    glue::glue("{url}/{endpoint}"),
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
  } else {
    cont
  }
}
