#' List results
#'
#' Results represent the output of assays that have been performed. You can
#' customize the schemas of results to fit your needs. Results can link to runs,
#' batches, and other types.To learn more about creating results, [click
#' here](https://docs.benchling.com/docs/example-creating-results).
#'
#' @md
#' @param assay_result_id assay_results id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{schemaId}{ID of the assay result schema to filter by}
#'    \item{minCreatedTime}{Filter by results created after this unix timestamp}
#'    \item{maxCreatedTime}{Filter by results created before this unix timestamp}
#'    \item{sort}{Method by which to order search results. Valid sorts are createdAt (created time, oldest first). Use :asc or :desc to specify ascending or descending order. Default is createdAt:asc.}
#'    \item{nextToken}{Token for pagination}
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{entityIds}{Filter by comma-separated list of related Entity IDs, maximum of 20.}
#'    \item{storageIds}{Filter by comma-separated list of related storage (container, box, plate, or location) IDs, maximum of 20.}
#'    \item{assayRunIds}{Filter by comma-separated list of associated AssayRun IDs.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#' }
#'
#' @return data from `assay_results` endpoint
#' @export
#'
#' @rdname assay_results
get_assay_results <- function(assay_result_id = NULL, ...) {
  endpoint <- "assay_results"
  if (!is.null(assay_result_id)) {
    endpoint <- glue::glue("assay_results/{assay_result_id}")
  }
  get_benchling(endpoint, query = ...)
}
