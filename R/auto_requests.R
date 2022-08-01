#' List requests
#'
#' Requests allow scientists and teams to collaborate around experimental assays
#' and workflows.
#'
#' @md
#' @param request_id requests id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{minCreatedTime}{minimum create time (unix seconds)}
#'    \item{maxCreatedTime}{maximum create time (unix seconds)}
#' }
#' 
#' @return data from `requests` endpoint
#' @export
#'
#' @rdname requests
get_requests <- function(request_id = NULL, ...) {
  endpoint <- "requests"
  if (!is.null(request_id)) {
    endpoint <- glue::glue("requests/{request_id}")
  }
  get_benchling(endpoint, query = ...)
}

