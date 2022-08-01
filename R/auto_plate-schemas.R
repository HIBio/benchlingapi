#' List plate schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide
#' in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas
#' impact our developers
#'
#' @md
#' @param schema_id plate_schemas id
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
  endpoint <- "plate_schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("plate_schemas/{schema_id}")
  }
  get_benchling(endpoint, query = ...)
}
