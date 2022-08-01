#' List workflows
#'
#' Please use endpoints for Legacy Workflows. These deprecated endpoints will be
#' removed once users are migrated onto Legacy Workflows endpoints.
#'
#' @md
#' @param workflow_id workflows id
#' @param ... (ignored)
#' 
#' @return data from `workflows` endpoint
#' @export
#'
#' @rdname workflows
get_workflows <- function(workflow_id = NULL, ...) {
  endpoint <- "workflows"
  if (!is.null(workflow_id)) {
    endpoint <- glue::glue("workflows/{workflow_id}")
  }
  get_benchling(endpoint, query = ...)
}

