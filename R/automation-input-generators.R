#' Lab Automation
#'
#' Lab Automation endpoints support integration with lab instruments, and liquid handlers to create samples or results, and capture transfers between containers at scale.
#'
#' @param input_generator_id automation_input_generators id
#'
#' @return data from automation_input_generators endpoint
#' @export
#'
#' @rdname automation_input_generators
get_automation_input_generators <- function(input_generator_id = NULL) {
  endpoint <- "automation_input_generators"
  if (!is.null(input_generator_id)) {
    endpoint <- glue::glue("automation_input_generators/{input_generator_id}")
  }
  get_benchling(endpoint)
}

