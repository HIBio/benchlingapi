#' List runs
#'
#' Runs capture the details / parameters of a run that was performed. Results are
#' usually nested under a run.
#'
#' @md
#' @param assay_run_id assay_runs id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{schemaId}{ID of the assay run schema to filter by}
#'    \item{minCreatedTime}{Filter by runs created after this unix timestamp}
#'    \item{maxCreatedTime}{Filter by runs created before this unix timestamp}
#'    \item{nextToken}{Token for pagination}
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#' }
#' 
#' @return data from `assay_runs` endpoint
#' @export
#'
#' @rdname assay_runs
get_assay_runs <- function(assay_run_id = NULL, ...) {
  endpoint <- "assay_runs"
  if (!is.null(assay_run_id)) {
    endpoint <- glue::glue("assay_runs/{assay_run_id}")
  }
  get_benchling(endpoint, query = ...)
}

