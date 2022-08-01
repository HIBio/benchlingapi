#' List box schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas impact our developers
#'
#' @param schema_id box_schemas id
#'
#' @return data from box_schemas endpoint
#' @export
#'
#' @rdname box_schemas
get_box_schemas <- function(schema_id = NULL) {
  endpoint <- "box_schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("box_schemas/{schema_id}")
  }
  get_benchling(endpoint)
}
