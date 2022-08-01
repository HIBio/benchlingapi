#' List DNA Alignments
#'
#' A DNA alignment is a Benchling object representing an alignment of multiple DNA
#' sequences.
#'
#' @md
#' @param dna_alignment_id dna_alignments id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{nextToken}{Token for pagination}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{name}{Name of a DNA Alignment. Restricts results to those with the specified name.}
#'    \item{nameIncludes}{Name substring of a DNA Alignment. Restricts results to those with names that include the provided substring.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{names.anyOf}{Comma-separated list of names. Restricts results to those that match any of the specified names, case insensitive.  Warning - this filter can be non-performant due to case insensitivity.}
#'    \item{names.anyOf.caseSensitive}{Comma-separated list of names. Restricts results to those that match any of the specified names, case sensitive.}
#'    \item{sequenceIds}{Comma-separated list of sequence ids that own one or more DNA Alignments (i.e. ids of sequences used as the template in a Template Alignment or created as the consensus sequence from a Consensus Alignment). Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#' }
#' 
#' @return data from `dna_alignments` endpoint
#' @export
#'
#' @rdname dna_alignments
get_dna_alignments <- function(dna_alignment_id = NULL, ...) {
  endpoint <- "dna_alignments"
  if (!is.null(dna_alignment_id)) {
    endpoint <- glue::glue("dna_alignments/{dna_alignment_id}")
  }
  get_benchling(endpoint, query = ...)
}

