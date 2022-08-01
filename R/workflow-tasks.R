#' List workflow tasks
#'
#' Workflow tasks encapsulate a single unit of work
#'
#' @md
#' @param workflow_task_id workflow_tasks id
#'
#' @return data from workflow_tasks endpoint
#' @export
#'
#' @rdname workflow_tasks
get_workflow_tasks <- function(workflow_task_id = NULL) {
  endpoint <- "workflow_tasks"
  if (!is.null(workflow_task_id)) {
    endpoint <- glue::glue("workflow_tasks/{workflow_task_id}")
  }
  get_benchling(endpoint)
}
