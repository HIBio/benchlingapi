#' List Oligos
#'
#' Oligos are short linear DNA sequences that can be attached as primers to full
#' DNA sequences. Just like other entities, they support schemas, tags, and
#' aliases.Please migrate to the corresponding DNA Oligos endpoints so that we can
#' support RNA Oligos.
#'
#' @md
#' @param oligo_id oligos id
#'
#' @return data from oligos endpoint
#' @export
#'
#' @rdname oligos
get_oligos <- function(oligo_id = NULL) {
  endpoint <- "oligos"
  if (!is.null(oligo_id)) {
    endpoint <- glue::glue("oligos/{oligo_id}")
  }
  get_benchling(endpoint)
}
