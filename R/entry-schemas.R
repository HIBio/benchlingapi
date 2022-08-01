#' List entry schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @md
#' @param schema_id entry_schemas id
#'
#' @return data from entry_schemas endpoint
#' @export
#'
#' @rdname entry_schemas
get_entry_schemas <- function(schema_id = NULL) {
  endpoint <- "entry_schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("entry_schemas/{schema_id}")
  }
  get_benchling(endpoint)
}
