#' Legacy Workflows
#'
#' Legacy workflows allow orchestrating complex experiments.
#'
#' @param stage_id legacy-workflow-stages id
#' @param ... (ignored)
#'
#' @return data from `legacy_workflow_stages` endpoint
#' @export
#'
#' @rdname legacy_workflow_stages
get_legacy_workflow_stages <- function(stage_id = NULL, ...) {
  endpoint <- "legacy-workflow-stages"
  if (!is.null(stage_id)) {
    endpoint <- glue::glue("legacy-workflow-stages/{stage_id}")
  }
  get_benchling(endpoint, query = ...)
}
