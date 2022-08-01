#' List Request Fulfillments
#'
#' Requests allow scientists and teams to collaborate around experimental assays and workflows.
#'
#' @param request_fulfillment_id request_fulfillments id
#'
#' @return data from request_fulfillments endpoint
#' @export
#'
#' @rdname request_fulfillments
get_request_fulfillments <- function(request_fulfillment_id = NULL) {
  endpoint <- "request_fulfillments"
  if (!is.null(request_fulfillment_id)) {
    endpoint <- glue::glue("request_fulfillments/{request_fulfillment_id}")
  }
  get_benchling(endpoint)
}

