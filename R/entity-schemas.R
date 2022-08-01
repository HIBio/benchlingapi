#' List entity schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @md
#' @param schema_id entity_schemas id
#'
#' @return data from entity_schemas endpoint
#' @export
#'
#' @rdname entity_schemas
get_entity_schemas <- function(schema_id = NULL) {
  endpoint <- "entity_schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("entity_schemas/{schema_id}")
  }
  get_benchling(endpoint)
}
