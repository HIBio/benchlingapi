#' List request task schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas impact our developers
#'
#' @param schema_id request_task_schemas id
#'
#' @return data from request_task_schemas endpoint
#' @export
#'
#' @rdname request_task_schemas
get_request_task_schemas <- function(schema_id = NULL) {
  endpoint <- "request_task_schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("request_task_schemas/{schema_id}")
  }
  get_benchling(endpoint)
}
