#' List workflow outputs
#'
#' Workflow outputs are outputs of a workflow task
#'
#' @md
#' @param workflow_output_id workflow_outputs id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{ids}{Comma separated list of workflow output IDs}
#'    \item{workflowTaskGroupIds}{Comma separated list of workflow IDs}
#'    \item{workflowTaskIds}{Comma separated list of workflow task IDs}
#'    \item{schemaId}{The ID of the workflow task schema of the workflow output}
#'    \item{watcherIds}{Comma separated list of user IDs or "null"}
#'    \item{responsibleTeamIds}{Comma separated list of team IDs or "null"}
#'    \item{creationOriginIds}{Comma separated list of entry IDs}
#'    \item{linkedItemIds.anyOf}{Comma separated list of bioentity or storable IDs. Returns workflow outputs where the output's schema fields reference at least one of the provided items.}
#'    \item{linkedItemIds.allOf}{Comma separated list of bioentity or storable IDs. Returns workflow outputs where the output's schema fields reference all of the provided items.}
#'    \item{linkedItemIds.noneOf}{Comma separated list of bioentity or storable IDs. Returns workflow outputs where the output's schema fields do not reference any of the provided items.}
#'    \item{schemaFields}{Schema field value. For Integer, Float, and Date type fields, supports the >= and <= operators. If present, the schemaId param must also be present. Restricts results to those with a field of whose value matches the filter.}
#'    \item{name}{The name of the workflow task}
#'    \item{nameIncludes}{Part of the name of the workflow task}
#'    \item{creatorIds}{Comma separated list of user IDs.}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{displayIds}{Comma-separated list of Workflow Output Display IDs.}
#'    \item{archiveReason}{Archive reason. Restricts items to those with the specified archive reason. Use "NOT_ARCHIVED" to filter for unarchived workflow outputs. Use "ANY_ARCHIVED" to filter for archived workflow outputs regardless of reason. Use "ANY_ARCHIVED_OR_NOT_ARCHIVED" to return items for both archived and unarchived.}
#' }
#'
#' @return data from `workflow_outputs` endpoint
#' @export
#'
#' @rdname workflow_outputs
get_workflow_outputs <- function(workflow_output_id = NULL, ...) {
  endpoint <- "workflow_outputs"
  if (!is.null(workflow_output_id)) {
    endpoint <- glue::glue("workflow_outputs/{workflow_output_id}")
  }
  get_benchling(endpoint, query = ...)
}
