#' List workflow outputs
#'
#' Workflow outputs are outputs of a workflow task
#'
#' @param workflow_output_id workflow_outputs id
#'
#' @return data from workflow_outputs endpoint
#' @export
#'
#' @rdname workflow_outputs
get_workflow_outputs <- function(workflow_output_id = NULL) {
  endpoint <- "workflow_outputs"
  if (!is.null(workflow_output_id)) {
    endpoint <- glue::glue("workflow_outputs/{workflow_output_id}")
  }
  get_benchling(endpoint)
}

