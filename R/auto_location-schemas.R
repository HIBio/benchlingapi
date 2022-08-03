#' List location schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @param schema_id location-schemas id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'
#' }
#'
#' @return data from `location_schemas` endpoint
#' @export
#'
#' @rdname location_schemas
get_location_schemas <- function(schema_id = NULL, ...) {
  endpoint <- "location-schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("location-schemas/{schema_id}")
  }
  get_benchling(endpoint, query = ...)
}
