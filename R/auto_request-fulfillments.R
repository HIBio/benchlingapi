#' List Request Fulfillments
#'
#' Requests allow scientists and teams to collaborate around experimental assays
#' and workflows.
#'
#' @md
#' @param request_fulfillment_id request-fulfillments id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#' }
#'
#' @return data from `request_fulfillments` endpoint
#' @export
#'
#' @rdname request_fulfillments
get_request_fulfillments <- function(request_fulfillment_id = NULL, ...) {
  endpoint <- "request-fulfillments"
  if (!is.null(request_fulfillment_id)) {
    endpoint <- glue::glue("request-fulfillments/{request_fulfillment_id}")
  }
  get_benchling(endpoint, query = ...)
}
