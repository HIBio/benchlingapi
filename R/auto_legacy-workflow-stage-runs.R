#' Legacy Workflows
#'
#' Legacy workflows allow orchestrating complex experiments.
#'
#' @param stage_run_id legacy-workflow-stage-runs id
#' @param ... (ignored)
#'
#' @return data from `legacy_workflow_stage_runs` endpoint
#' @export
#'
#' @rdname legacy_workflow_stage_runs
get_legacy_workflow_stage_runs <- function(stage_run_id = NULL, ...) {
  endpoint <- "legacy-workflow-stage-runs"
  if (!is.null(stage_run_id)) {
    endpoint <- glue::glue("legacy-workflow-stage-runs/{stage_run_id}")
  }
  get_benchling(endpoint, ...)
}
