#' Legacy Workflows
#'
#' Legacy workflows allow orchestrating complex experiments.
#'
#' @param stage_id legacy_workflow_stages id
#'
#' @return data from legacy_workflow_stages endpoint
#' @export
#'
#' @rdname legacy_workflow_stages
get_legacy_workflow_stages <- function(stage_id = NULL) {
  endpoint <- "legacy_workflow_stages"
  if (!is.null(stage_id)) {
    endpoint <- glue::glue("legacy_workflow_stages/{stage_id}")
  }
  get_benchling(endpoint)
}

