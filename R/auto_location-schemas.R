#' List location schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @md
#' @param schema_id location_schemas id
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
  endpoint <- "location_schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("location_schemas/{schema_id}")
  }
  get_benchling(endpoint, query = ...)
}
