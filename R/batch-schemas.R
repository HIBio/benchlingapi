#' List batch schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @md
#' @param schema_id batch_schemas id
#'
#' @return data from batch_schemas endpoint
#' @export
#'
#' @rdname batch_schemas
get_batch_schemas <- function(schema_id = NULL) {
  endpoint <- "batch_schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("batch_schemas/{schema_id}")
  }
  get_benchling(endpoint)
}
