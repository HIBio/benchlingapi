#' List non-empty Automation Output Processors
#'
#' Lab Automation endpoints support integration with lab instruments, and liquid handlers to create samples or results, and capture transfers between containers at scale.
#'
#' @param output_processor_id automation_output_processors id
#'
#' @return data from automation_output_processors endpoint
#' @export
#'
#' @rdname automation_output_processors
get_automation_output_processors <- function(output_processor_id = NULL) {
  endpoint <- "automation_output_processors"
  if (!is.null(output_processor_id)) {
    endpoint <- glue::glue("automation_output_processors/{output_processor_id}")
  }
  get_benchling(endpoint)
}
