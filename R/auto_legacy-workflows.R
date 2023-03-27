#' List legacy workflows
#'
#' Legacy workflows allow orchestrating complex experiments.
#'
#' @param legacy_workflow_id legacy-workflows id
#' @param ... (ignored)
#'
#' @return data from `legacy_workflows` endpoint
#' @export
#'
#' @rdname legacy_workflows
get_legacy_workflows <- function(legacy_workflow_id = NULL, ...) {
  endpoint <- "legacy-workflows"
  if (!is.null(legacy_workflow_id)) {
    endpoint <- glue::glue("legacy-workflows/{legacy_workflow_id}")
  }
  get_benchling(endpoint, ...)
}
