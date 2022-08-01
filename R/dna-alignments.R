#' List DNA Alignments
#'
#' A DNA alignment is a Benchling object representing an alignment of multiple DNA sequences.
#'
#' @param dna_alignment_id dna_alignments id
#'
#' @return data from dna_alignments endpoint
#' @export
#'
#' @rdname dna_alignments
get_dna_alignments <- function(dna_alignment_id = NULL) {
  endpoint <- "dna_alignments"
  if (!is.null(dna_alignment_id)) {
    endpoint <- glue::glue("dna_alignments/{dna_alignment_id}")
  }
  get_benchling(endpoint)
}

