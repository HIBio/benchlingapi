#' List workflow tasks
#'
#' Workflow tasks encapsulate a single unit of work
#'
#' @md
#' @param workflow_task_id workflow_tasks id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{ids}{Comma separated list of workflow task IDs}
#'    \item{workflowTaskGroupIds}{Comma separated list of workflow IDs}
#'    \item{schemaId}{The ID of the workflow task schema of the workflow task}
#'    \item{statusIds}{Comma separated list of workflow task status ids}
#'    \item{assigneeIds}{Comma separated list of user ids or "null"}
#'    \item{watcherIds}{Comma separated list of user IDs or "null"}
#'    \item{responsibleTeamIds}{Comma separated list of team IDs or "null"}
#'    \item{executionOriginIds}{Comma separated list of entry IDs}
#'    \item{executionTypes}{Comma separated list of workflow execution types. Acceptable execution types are "DIRECT" and "ENTRY"}
#'    \item{linkedItemIds.anyOf}{Comma separated list of bioentity or storable IDs. Returns workflow tasks where the task's schema fields reference at least one of the provided items.}
#'    \item{linkedItemIds.allOf}{Comma separated list of bioentity or storable IDs. Returns workflow tasks where the task's schema fields reference all of the provided items.}
#'    \item{linkedItemIds.noneOf}{Comma separated list of bioentity or storable IDs. Returns workflow tasks where the task's schema fields do not reference any of the provided items.}
#'    \item{schemaFields}{Schema field value. For Integer, Float, and Date type fields, supports the >= and <= operators. If present, the schemaId param must also be present. Restricts results to those with a field of whose value matches the filter.}
#'    \item{name}{The name of the workflow task}
#'    \item{nameIncludes}{Part of the name of the workflow task}
#'    \item{creatorIds}{Comma separated list of user IDs.}
#'    \item{scheduledOn}{The date on which the task was scheduled to be executed. Returns tasks which are scheduled on the provided date. If "null" is provided returns tasks which are unshceduled.}
#'    \item{scheduledOn.lt}{The date on which the task was scheduled to be executed. Returns tasks which are scheduled before the provided date.}
#'    \item{scheduledOn.lte}{The date on which the task was scheduled to be executed. Returns tasks which are scheduled before or on the provided date.}
#'    \item{scheduledOn.gte}{The date on which the task was scheduled to be executed. Returns tasks which are scheduled on or after the provided date.}
#'    \item{scheduledOn.gt}{The date on which the task was scheduled to be executed. Returns tasks which are scheduled after the provided date.}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{displayIds}{Comma-separated list of Workflow Task Display IDs.}
#'    \item{archiveReason}{Archive reason. Restricts items to those with the specified archive reason. Use "NOT_ARCHIVED" to filter for unarchived workflow tasks. Use "ANY_ARCHIVED" to filter for archived workflow tasks regardless of reason. Use "ANY_ARCHIVED_OR_NOT_ARCHIVED" to return items for both archived and unarchived.}
#' }
#' 
#' @return data from `workflow_tasks` endpoint
#' @export
#'
#' @rdname workflow_tasks
get_workflow_tasks <- function(workflow_task_id = NULL, ...) {
  endpoint <- "workflow_tasks"
  if (!is.null(workflow_task_id)) {
    endpoint <- glue::glue("workflow_tasks/{workflow_task_id}")
  }
  get_benchling(endpoint, query = ...)
}

