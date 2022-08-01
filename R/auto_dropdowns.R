#' List dropdowns
#'
#' Dropdowns are registry-wide enums. Use dropdowns to standardize on spelling and
#' naming conventions, especially for important metadata like resistance markers.
#'
#' @md
#' @param dropdown_id dropdowns id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'
#' }
#'
#' @return data from `dropdowns` endpoint
#' @export
#'
#' @rdname dropdowns
get_dropdowns <- function(dropdown_id = NULL, ...) {
  endpoint <- "dropdowns"
  if (!is.null(dropdown_id)) {
    endpoint <- glue::glue("dropdowns/{dropdown_id}")
  }
  get_benchling(endpoint, query = ...)
}
