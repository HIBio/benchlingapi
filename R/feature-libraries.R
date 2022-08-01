#' List Feature Libraries
#'
#' Feature Libraries are collections of shared canonical patterns that can be used to generate annotations on matching regions of DNA Sequences or AA Sequences.
#'
#' @param feature_library_id feature_libraries id
#'
#' @return data from feature_libraries endpoint
#' @export
#'
#' @rdname feature_libraries
get_feature_libraries <- function(feature_library_id = NULL) {
  endpoint <- "feature_libraries"
  if (!is.null(feature_library_id)) {
    endpoint <- glue::glue("feature_libraries/{feature_library_id}")
  }
  get_benchling(endpoint)
}
