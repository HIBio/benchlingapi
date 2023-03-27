#' List box contents
#'
#' Boxes are a structured storage type, consisting of a grid of positions that can
#' each hold one container. Unlike locations, there are a maximum number of
#' containers that a box can hold (one per position).Boxes are all associated with
#' schemas, which define the type of the box (e.g. "10x10 Cryo Box") along with
#' the fields that are tracked and the dimensions of the box.Like all storage,
#' every Box has a barcode that is unique across the registry.
#'
#' @param box_id box id
#' @param ... additional query parameters; see Details below
#'
#' Available query parameters:
#' \describe{
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{nextToken}{Token for pagination}
#' }
#'
#' @return data from `boxes/{box_id}/contents` endpoint
#' @export
get_box_contents <- function(box_id = NULL, ...) {
  endpoint <- "boxes"
  if (!is.null(box_id)) {
    endpoint <- glue::glue("boxes/{box_id}/contents")
  }
  get_benchling(endpoint, ...)
}
