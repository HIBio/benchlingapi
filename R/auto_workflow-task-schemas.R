#' List workflow task schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @md
#' @param schema_id workflow-task-schemas id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#' }
#'
#' @return data from `workflow_task_schemas` endpoint
#' @export
#'
#' @rdname workflow_task_schemas
get_workflow_task_schemas <- function(schema_id = NULL, ...) {
  endpoint <- "workflow-task-schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("workflow-task-schemas/{schema_id}")
  }
  get_benchling(endpoint, query = ...)
}
