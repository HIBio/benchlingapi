#' List Features
#'
#' Feature Libraries are collections of shared canonical patterns that can be used
#' to generate annotations on matching regions of DNA Sequences or AA Sequences.
#'
#' @param feature_id features id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{nextToken}{Token for pagination}
#'    \item{name}{Name of a Feature. Restricts results to those with the specified name.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{names.anyOf.caseSensitive}{Comma-separated list of names. Restricts results to those that match any of the specified names.}
#'    \item{featureLibraryId}{Id of a Feature Library. Restricts results to those associated with the provided feature library}
#'    \item{featureType}{The type of feature, like gene, promoter, etc. Note: This is an arbitrary string, not an enum}
#'    \item{matchType}{The match type of the feature used to determine how auto-annotate matches are made.}
#' }
#'
#' @return data from `features` endpoint
#' @export
#'
#' @rdname features
get_features <- function(feature_id = NULL, ...) {
  endpoint <- "features"
  if (!is.null(feature_id)) {
    endpoint <- glue::glue("features/{feature_id}")
  }
  get_benchling(endpoint, query = ...)
}
