#' Legacy Workflows (deprecated)
#'
#' Please use endpoints for Legacy Workflows. These deprecated endpoints will be
#' removed once users are migrated onto Legacy Workflows endpoints.
#'
#' @param stage_run_id workflow-stage-runs id
#' @param ... (ignored)
#'
#' @return data from `workflow_stage_runs` endpoint
#' @export
#'
#' @rdname workflow_stage_runs
get_workflow_stage_runs <- function(stage_run_id = NULL, ...) {
  endpoint <- "workflow-stage-runs"
  if (!is.null(stage_run_id)) {
    endpoint <- glue::glue("workflow-stage-runs/{stage_run_id}")
  }
  get_benchling(endpoint, ...)
}
