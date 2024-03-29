#' List Feature Libraries
#'
#' Feature Libraries are collections of shared canonical patterns that can be used
#' to generate annotations on matching regions of DNA Sequences or AA Sequences.
#'
#' @param feature_library_id feature-libraries id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{nextToken}{Token for pagination}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{name}{Name of a Feature Library. Restricts results to those with the specified name.}
#'    \item{nameIncludes}{Name substring of a Feature Library. Restricts results to those with names that include the provided substring.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{names.anyOf}{Comma-separated list of names. Restricts results to those that match any of the specified names.}
#' }
#'
#' @return data from `feature_libraries` endpoint
#' @export
#'
#' @rdname feature_libraries
get_feature_libraries <- function(feature_library_id = NULL, ...) {
  endpoint <- "feature-libraries"
  if (!is.null(feature_library_id)) {
    endpoint <- glue::glue("feature-libraries/{feature_library_id}")
  }
  get_benchling(endpoint, ...)
}
