#' List workflow task groups
#'
#' Workflow task groups are groups of workflow tasks of the same schema
#'
#' @md
#' @param workflow_task_group_id workflow_task_groups id
#'
#' @return data from workflow_task_groups endpoint
#' @export
#'
#' @rdname workflow_task_groups
get_workflow_task_groups <- function(workflow_task_group_id = NULL) {
  endpoint <- "workflow_task_groups"
  if (!is.null(workflow_task_group_id)) {
    endpoint <- glue::glue("workflow_task_groups/{workflow_task_group_id}")
  }
  get_benchling(endpoint)
}
