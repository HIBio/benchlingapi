#' List DNA Oligos
#'
#' DNA Oligos are short linear DNA sequences that can be attached as primers to
#' full DNA sequences. Just like other entities, they support schemas, tags, and
#' aliases.
#'
#' @md
#' @param oligo_id dna_oligos id
#'
#' @return data from dna_oligos endpoint
#' @export
#'
#' @rdname dna_oligos
get_dna_oligos <- function(oligo_id = NULL) {
  endpoint <- "dna_oligos"
  if (!is.null(oligo_id)) {
    endpoint <- glue::glue("dna_oligos/{oligo_id}")
  }
  get_benchling(endpoint)
}
