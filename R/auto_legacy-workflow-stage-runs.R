#' Legacy Workflows
#'
#' Legacy workflows allow orchestrating complex experiments.
#'
#' @md
#' @param stage_run_id legacy_workflow_stage_runs id
#' @param ... (ignored)
#' 
#' @return data from `legacy_workflow_stage_runs` endpoint
#' @export
#'
#' @rdname legacy_workflow_stage_runs
get_legacy_workflow_stage_runs <- function(stage_run_id = NULL, ...) {
  endpoint <- "legacy_workflow_stage_runs"
  if (!is.null(stage_run_id)) {
    endpoint <- glue::glue("legacy_workflow_stage_runs/{stage_run_id}")
  }
  get_benchling(endpoint, query = ...)
}

