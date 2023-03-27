#' Get app configuration items
#'
#' Create and manage Benchling apps on your tenant
#'
#' @param item_id app-configuration-items id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{nextToken}{Token for pagination}
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{appId}{App id to which the configuration belongs.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#' }
#'
#' @return data from `app_configuration_items` endpoint
#' @export
#'
#' @rdname app_configuration_items
get_app_configuration_items <- function(item_id = NULL, ...) {
  endpoint <- "app-configuration-items"
  if (!is.null(item_id)) {
    endpoint <- glue::glue("app-configuration-items/{item_id}")
  }
  get_benchling(endpoint, ...)
}
