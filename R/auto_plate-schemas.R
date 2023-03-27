#' List plate schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @param schema_id plate-schemas id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'
#' }
#'
#' @return data from `plate_schemas` endpoint
#' @export
#'
#' @rdname plate_schemas
get_plate_schemas <- function(schema_id = NULL, ...) {
  endpoint <- "plate-schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("plate-schemas/{schema_id}")
  }
  get_benchling(endpoint, ...)
}
