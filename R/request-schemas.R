#' List request schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @md
#' @param schema_id request_schemas id
#'
#' @return data from request_schemas endpoint
#' @export
#'
#' @rdname request_schemas
get_request_schemas <- function(schema_id = NULL) {
  endpoint <- "request_schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("request_schemas/{schema_id}")
  }
  get_benchling(endpoint)
}
