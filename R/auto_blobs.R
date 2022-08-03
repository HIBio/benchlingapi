#' Blobs
#'
#' Blobs are opaque files that can be linked to other items in Benchling, like
#' assay runs or results. For example, you can upload a blob, then upload an assay
#' result that links to that blob by ID. The blob will then appear as part of the
#' assay result in the Benchling web UI.
#'
#' @param blob_id blobs id
#' @param ... (ignored)
#'
#' @return data from `blobs` endpoint
#' @export
#'
#' @rdname blobs
get_blobs <- function(blob_id = NULL, ...) {
  endpoint <- "blobs"
  if (!is.null(blob_id)) {
    endpoint <- glue::glue("blobs/{blob_id}")
  }
  get_benchling(endpoint, query = ...)
}
