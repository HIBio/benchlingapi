#' List batch schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @md
#' @param schema_id batch_schemas id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#' }
#' 
#' @return data from `batch_schemas` endpoint
#' @export
#'
#' @rdname batch_schemas
get_batch_schemas <- function(schema_id = NULL, ...) {
  endpoint <- "batch_schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("batch_schemas/{schema_id}")
  }
  get_benchling(endpoint, query = ...)
}

