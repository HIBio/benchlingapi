#' List runs
#'
#' Runs capture the details / parameters of a run that was performed. Results are
#' usually nested under a run.
#'
#' @md
#' @param assay_run_id assay_runs id
#'
#' @return data from assay_runs endpoint
#' @export
#'
#' @rdname assay_runs
get_assay_runs <- function(assay_run_id = NULL) {
  endpoint <- "assay_runs"
  if (!is.null(assay_run_id)) {
    endpoint <- glue::glue("assay_runs/{assay_run_id}")
  }
  get_benchling(endpoint)
}
