#' List Features
#'
#' Feature Libraries are collections of shared canonical patterns that can be used to generate annotations on matching regions of DNA Sequences or AA Sequences.
#'
#' @param feature_id features id
#'
#' @return data from features endpoint
#' @export
#'
#' @rdname features
get_features <- function(feature_id = NULL) {
  endpoint <- "features"
  if (!is.null(feature_id)) {
    endpoint <- glue::glue("features/{feature_id}")
  }
  get_benchling(endpoint)
}

