#' List DNA sequences
#'
#' DNA sequences are the bread and butter of the Benchling Molecular Biology suite. On Benchling, these are comprised of a string of nucleotides and collections of other attributes, such as annotations and primers.
#'
#' @param dna_sequence_id dna_sequences id
#'
#' @return data from dna_sequences endpoint
#' @export
#'
#' @rdname dna_sequences
get_dna_sequences <- function(dna_sequence_id = NULL) {
  endpoint <- "dna_sequences"
  if (!is.null(dna_sequence_id)) {
    endpoint <- glue::glue("dna_sequences/{dna_sequence_id}")
  }
  get_benchling(endpoint)
}

