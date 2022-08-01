#' List AA sequences
#'
#' AA Sequences are the working units of cells that make everything run (they help make structures, catalyze reactions and allow for signaling - a kind of internal cell communication). On Benchling, these are comprised of a string of amino acids and collections of other attributes, such as annotations.
#'
#' @param aa_sequence_id aa_sequences id
#'
#' @return data from aa_sequences endpoint
#' @export
#'
#' @rdname aa_sequences
get_aa_sequences <- function(aa_sequence_id = NULL) {
  endpoint <- "aa_sequences"
  if (!is.null(aa_sequence_id)) {
    endpoint <- glue::glue("aa_sequences/{aa_sequence_id}")
  }
  get_benchling(endpoint)
}
