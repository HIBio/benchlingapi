#' List workflow task groups
#'
#' Workflow task groups are groups of workflow tasks of the same schema
#'
#' @md
#' @param workflow_task_group_id workflow-task-groups id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{ids}{Comma separated list of workflow task group IDs}
#'    \item{schemaId}{The workflow task schema ID of tasks in this task group}
#'    \item{folderId}{A folder ID}
#'    \item{projectId}{A project ID}
#'    \item{mentionedIn}{A comma separated list entry IDs}
#'    \item{watcherIds}{Comma separated list of user IDs or "null"}
#'    \item{executionTypes}{Comma separated list of workflow execution types. Acceptable execution types are "DIRECT" and "ENTRY"}
#'    \item{responsibleTeamIds}{Comma separated list of team IDs or "null"}
#'    \item{statusIds.anyOf}{Commas separated list of Status ids. Returns workflows where at least one task is of one of the provided statuses.}
#'    \item{statusIds.noneOf}{Commas separated list of Status ids. Returns workflows where none of the tasks are of any of the provided statuses.}
#'    \item{statusIds.only}{Commas separated list of Status ids. Returns workflows where all of the tasks are of one of the provided statuses.}
#'    \item{name}{The name of the workflow task group}
#'    \item{nameIncludes}{Part of the name of the workflow task group}
#'    \item{creatorIds}{Comma separated list of user IDs.}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{displayIds}{Comma-separated list of Workflow Display IDs.}
#'    \item{archiveReason}{Archive reason. Restricts items to those with the specified archive reason. Use "NOT_ARCHIVED" to filter for unarchived workflow task groups. Use "ANY_ARCHIVED" to filter for archived workflow task groups regardless of reason. Use "ANY_ARCHIVED_OR_NOT_ARCHIVED" to return items for both archived and unarchived.}
#' }
#'
#' @return data from `workflow_task_groups` endpoint
#' @export
#'
#' @rdname workflow_task_groups
get_workflow_task_groups <- function(workflow_task_group_id = NULL, ...) {
  endpoint <- "workflow-task-groups"
  if (!is.null(workflow_task_group_id)) {
    endpoint <- glue::glue("workflow-task-groups/{workflow_task_group_id}")
  }
  get_benchling(endpoint, query = ...)
}
