#' List RNA Oligos
#'
#' RNA Oligos are short linear RNA sequences that can be attached as primers to
#' full DNA sequences. Just like other entities, they support schemas, tags, and
#' aliases.
#'
#' @md
#' @param oligo_id rna_oligos id
#'
#' @return data from rna_oligos endpoint
#' @export
#'
#' @rdname rna_oligos
get_rna_oligos <- function(oligo_id = NULL) {
  endpoint <- "rna_oligos"
  if (!is.null(oligo_id)) {
    endpoint <- glue::glue("rna_oligos/{oligo_id}")
  }
  get_benchling(endpoint)
}
