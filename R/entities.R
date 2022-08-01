#' Batches
#'
#' Batches represent physical quantities of a sequence, protein, or other biological entity. A batch is identified by its biological entity's name (or Registry ID, if the entity is registered), its date of creation, and an optional inventory number.
#'
#' @param entity_id entities id
#'
#' @return data from entities endpoint
#' @export
#'
#' @rdname entities
get_entities <- function(entity_id = NULL) {
  endpoint <- "entities"
  if (!is.null(entity_id)) {
    endpoint <- glue::glue("entities/{entity_id}")
  }
  get_benchling(endpoint)
}

