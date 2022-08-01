#' List container schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @md
#' @param schema_id container_schemas id
#'
#' @return data from container_schemas endpoint
#' @export
#'
#' @rdname container_schemas
get_container_schemas <- function(schema_id = NULL) {
  endpoint <- "container_schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("container_schemas/{schema_id}")
  }
  get_benchling(endpoint)
}
