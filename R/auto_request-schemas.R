#' List request schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @param schema_id request-schemas id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#' }
#'
#' @return data from `request_schemas` endpoint
#' @export
#'
#' @rdname request_schemas
get_request_schemas <- function(schema_id = NULL, ...) {
  endpoint <- "request-schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("request-schemas/{schema_id}")
  }
  get_benchling(endpoint, ...)
}
