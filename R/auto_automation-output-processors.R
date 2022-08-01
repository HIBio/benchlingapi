#' List non-empty Automation Output Processors
#'
#' Lab Automation endpoints support integration with lab instruments, and liquid
#' handlers to create samples or results, and capture transfers between containers
#' at scale.
#'
#' @md
#' @param output_processor_id automation_output_processors id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{assayRunId}{Id of the Run}
#'    \item{automationFileConfigName}{Name of the Automation File Config}
#'    \item{archiveReason}{Archive reason. Restricts items to those with the specified archive reason. Use "NOT_ARCHIVED" to filter for unarchived processors. Use "ANY_ARCHIVED" to filter for archived processors regardless of reason. Use "ANY_ARCHIVED_OR_NOT_ARCHIVED" to return items for both archived and unarchived.}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{nextToken}{Token for pagination}
#' }
#'
#' @return data from `automation_output_processors` endpoint
#' @export
#'
#' @rdname automation_output_processors
get_automation_output_processors <- function(output_processor_id = NULL, ...) {
  endpoint <- "automation_output_processors"
  if (!is.null(output_processor_id)) {
    endpoint <- glue::glue("automation_output_processors/{output_processor_id}")
  }
  get_benchling(endpoint, query = ...)
}
