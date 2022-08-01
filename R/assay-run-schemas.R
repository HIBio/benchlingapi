#' List assay run schemas
#'
#' Schemas represent custom configuration of objects in Benchling. See this [guide in our documentation](https://docs.benchling.com/docs/schemas) on how Schemas impact our developers
#'
#' @param schema_id assay_run_schemas id
#'
#' @return data from assay_run_schemas endpoint
#' @export
#'
#' @rdname assay_run_schemas
get_assay_run_schemas <- function(schema_id = NULL) {
  endpoint <- "assay_run_schemas"
  if (!is.null(schema_id)) {
    endpoint <- glue::glue("assay_run_schemas/{schema_id}")
  }
  get_benchling(endpoint)
}
