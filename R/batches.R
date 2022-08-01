#' List batches
#'
#' Batches represent physical quantities of a sequence, protein, or other
#' biological entity. A batch is identified by its biological entity's name (or
#' Registry ID, if the entity is registered), its date of creation, and an
#' optional inventory number.
#'
#' @md
#' @param batch_id batches id
#'
#' @return data from batches endpoint
#' @export
#'
#' @rdname batches
get_batches <- function(batch_id = NULL) {
  endpoint <- "batches"
  if (!is.null(batch_id)) {
    endpoint <- glue::glue("batches/{batch_id}")
  }
  get_benchling(endpoint)
}
