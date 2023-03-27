get_benchling <- function(endpoint, org = get_org(), json = FALSE, quiet = FALSE, ...) {
  endpoint <- utils::URLencode(endpoint)
  logger::log_debug("GET ", org, " with endpoint: ", endpoint)
  query <- list(...)
  if (length(query)) {
    logger::log_debug("Building query from `...` arguments")
    query <- as.list(stats::setNames(utils::URLencode(as.character(query)), names(query)))
    logger::log_debug("query to be sent: ", query)
  }
  url <- glue::glue("https://{org}.benchling.com/api/v2/")
  resp <- httr::GET(
    url = glue::glue("{url}/{endpoint}"),
    query = query,
    httr::authenticate(get_token(), "")
  )
  if (!(sc <- httr::status_code(resp)) == 200L) {
    logger::log_error("** Request returned status ", sc)
    return(invisible(resp))
  }
  logger::log_success("Returned status code: ", sc)
  ep <- if (grepl("/", endpoint)) {
    sub("/.*", "", endpoint)
  } else {
    endpoint
  }

  contents <- httr::content(resp, as = "text", encoding = "UTF-8")
  headers <- httr::headers(resp)

  if (!json) {
    # convert from json
    contents <- jsonlite::fromJSON(contents, flatten = TRUE)

    res <- extract_named_endpoint(contents, ep)

    # if we're in a pagination loop, return the contents
    if (!is.null(query[["nextToken"]])) {
      logger::log_debug("Pagination loop detected. Setting `nextToken`")
      attr(res, "nextToken") <- contents[["nextToken"]]
      return(res)
    }

    total_ps <- query[["pageSize"]]

    if (is.null(total_ps) && is.data.frame(res) && nrow(res) == 50L && !quiet) {
      message("Exactly 50 results returned for endpoint ", endpoint, "; did you mean to request more?")
      message(" add query parameter `pageSize = n` to fetch more results")
      message(" Results available: ", headers[["result-count"]])
    }

    if (!is.null(total_ps) &&
      nrow(res) < as.integer(total_ps) &&
      utils::hasName(contents, "nextToken")) {
      if (!quiet) message("Pagination in process. Results available: ", headers[["result-count"]])
      nextToken <- contents$nextToken
      total_ps <- as.integer(total_ps)
      ps <- total_ps
      query <- append(query, list(endpoint = endpoint, org = org))
      while (nextToken != "" && nrow(res) < total_ps) {
        ps <- total_ps - nrow(res)
        if (!quiet) message("\rStill looking for ", ps, " results", strrep(" ", 10), appendLF = FALSE)
        query$nextToken <- nextToken
        query$pageSize <- ps
        new_contents <- do.call(Recall, query)
        nextToken <- attr(new_contents, "nextToken")
        newres <- extract_named_endpoint(new_contents, ep)
        res <- dplyr::bind_rows(res, newres)
      }
      if (!quiet) message("\rResult contains ", nrow(res), " rows", strrep(" ", 10))
    }
    res
  } else {
    # return json directly
    contents
  }
}

extract_named_endpoint <- function(d, ep) {
  if (utils::hasName(d, ep)) {
    d[[ep]]
  } else if (utils::hasName(d, camel_ep <- camel(ep))) {
    d[[camel_ep]]
  } else if (utils::hasName(d, "options")) {
    # dropdowns
    d[["options"]]
  } else if (utils::hasName(d, "fieldDefinitions")) {
    # schema definitions
    d[["fieldDefinitions"]]
  } else {
    d
  }
}

camel <- function(x) {
  gsub("(\\w)-(\\w)", "\\1\\U\\2", x, perl = TRUE)
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
  logger::log_info("Fetching API spec from ", url)
  resp <- httr::GET(url, httr::authenticate(get_token(), ""))
  if (!(sc <- httr::status_code(resp)) == 200L) {
    logger::log_warn("** Request returned status ", sc)
    return(invisible(resp))
  }
  yaml <- httr::content(resp, as = "text", encoding = "UTF-8")
  yaml::read_yaml(text = yaml)
}

post_benchling <- function(endpoint, body = NULL, org = get_org(), f = c("POST", "PATCH"), ...) {
  stopifnot(!is.null(body))
  logger::log_debug(f, " ", org, " with endpoint: ", endpoint)
  f <- match.arg(f)
  f <- switch(f,
    POST = httr::POST,
    PATCH = httr::PATCH
  )
  url <- glue::glue("https://{org}.benchling.com/api/v2/")
  resp <- f(
    url = glue::glue("{url}/{endpoint}"),
    body = jsonlite::toJSON(body, auto_unbox = TRUE),
    encode = "json",
    httr::authenticate(get_token(), "")
  )
  if (!(sc <- httr::status_code(resp)) %in% 200:299) {
    logger::log_error("** Request returned status ", sc)
    return(invisible(resp))
  }
  jsonlite::fromJSON(httr::content(resp, as = "text", encoding = "UTF-8"))
}
