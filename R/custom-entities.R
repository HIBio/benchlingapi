#' List custom entities
#'
#' Benchling supports custom entities for biological entities that are neither
#' sequences or proteins. Custom entities must have an entity schema set and can
#' have both schema fields and custom fields.
#'
#' @md
#' @param custom_entity_id custom_entities id
#'
#' @return data from custom_entities endpoint
#' @export
#'
#' @rdname custom_entities
get_custom_entities <- function(custom_entity_id = NULL) {
  endpoint <- "custom_entities"
  if (!is.null(custom_entity_id)) {
    endpoint <- glue::glue("custom_entities/{custom_entity_id}")
  }
  get_benchling(endpoint)
}
