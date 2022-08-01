#' List workflow task schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @md
#' @param schema_id workflow_task_schemas id
#'
#' @return data from workflow_task_schemas endpoint
#' @export
#'
#' @rdname workflow_task_schemas
get_workflow_task_schemas <- function(schema_id = NULL) {
  endpoint <- "workflow_task_schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("workflow_task_schemas/{schema_id}")
  }
  get_benchling(endpoint)
}
