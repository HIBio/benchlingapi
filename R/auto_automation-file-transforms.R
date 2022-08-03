#' Lab Automation
#'
#' Lab Automation endpoints support integration with lab instruments, and liquid
#' handlers to create samples or results, and capture transfers between containers
#' at scale.
#'
#' @param transform_id automation-file-transforms id
#' @param ... (ignored)
#'
#' @return data from `automation_file_transforms` endpoint
#' @export
#'
#' @rdname automation_file_transforms
get_automation_file_transforms <- function(transform_id = NULL, ...) {
  endpoint <- "automation-file-transforms"
  if (!is.null(transform_id)) {
    endpoint <- glue::glue("automation-file-transforms/{transform_id}")
  }
  get_benchling(endpoint, query = ...)
}
