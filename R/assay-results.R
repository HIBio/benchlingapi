#' List results
#'
#' Results represent the output of assays that have been performed. You can customize the schemas of results to fit your needs. Results can link to runs, batches, and other types.To learn more about creating results, [click here](https://docs.benchling.com/docs/example-creating-results).
#'
#' @param assay_result_id assay_results id
#'
#' @return data from assay_results endpoint
#' @export
#'
#' @rdname assay_results
get_assay_results <- function(assay_result_id = NULL) {
  endpoint <- "assay_results"
  if (!is.null(assay_result_id)) {
    endpoint <- glue::glue("assay_results/{assay_result_id}")
  }
  get_benchling(endpoint)
}

