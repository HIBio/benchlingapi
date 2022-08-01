#' Legacy Workflows (deprecated)
#'
#' Please use endpoints for Legacy Workflows. These deprecated endpoints will be removed once users are migrated onto Legacy Workflows endpoints.
#'
#' @param stage_id workflow_stages id
#'
#' @return data from workflow_stages endpoint
#' @export
#'
#' @rdname workflow_stages
get_workflow_stages <- function(stage_id = NULL) {
  endpoint <- "workflow_stages"
  if (!is.null(stage_id)) {
    endpoint <- glue::glue("workflow_stages/{stage_id}")
  }
  get_benchling(endpoint)
}

