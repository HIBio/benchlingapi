#' List entry schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @md
#' @param schema_id entry-schemas id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#' }
#'
#' @return data from `entry_schemas` endpoint
#' @export
#'
#' @rdname entry_schemas
get_entry_schemas <- function(schema_id = NULL, ...) {
  endpoint <- "entry-schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("entry-schemas/{schema_id}")
  }
  get_benchling(endpoint, query = ...)
}
