#' List entries
#'
#' Entries are rich text documents that allow you to capture all of your
#' experimental data in one place.
#'
#' @param entry_id entries id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{nextToken}{Token for pagination}
#'    \item{sort}{Method by which to order search results. Valid sorts are modifiedAt (modified time, most recent first) and name (entity name, alphabetical). Optionally add :asc or :desc to specify ascending or descending order.}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > operator. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{name}{Name of an Entry. Restricts results to those with the specified name.}
#'    \item{projectId}{ID of a project. Restricts results to those in the project.}
#'    \item{archiveReason}{Archive reason. Restricts items to those with the specified archive reason. Use "NOT_ARCHIVED" to filter for unarchived entries. Use "ANY_ARCHIVED" to filter for archived entries regardless of reason. Use "ANY_ARCHIVED_OR_NOT_ARCHIVED" to return items for both archived and unarchived.}
#'    \item{reviewStatus}{Restrict results to those with the given review status. Supported statuses: IN_PROGRESS, ACCEPTED, REJECTED, NEEDS_REVIEW, RETRACTED}
#'    \item{mentionedIn}{Comma-separated list of entry IDs. Restricts results to those mentioned within the entries in this list.}
#'    \item{mentions}{Comma-separated list of resource IDs. Restricts results to entries that mention the given items.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{schemaId}{ID of a schema. Restricts results to those of the specified schema.}
#'    \item{names.anyOf}{Comma-separated list of names. Restricts results to those that match any of the specified names, case insensitive.  Warning - this filter can be non-performant due to case insensitivity.}
#'    \item{names.anyOf.caseSensitive}{Comma-separated list of names. Restricts results to those that match any of the specified names, case sensitive.}
#'    \item{assignedReviewerIds.anyOf}{Comma-separated list of ids. Restricts results to entries that have assignees of any of the specified ids.}
#'    \item{creatorIds}{Comma separated list of users IDs}
#'    \item{authorIds.anyOf}{Comma separated list of user or app IDs}
#'    \item{displayIds}{Comma-separated list of Entry Display IDs.}
#' }
#'
#' @return data from `entries` endpoint
#' @export
#'
#' @rdname entries
get_entries <- function(entry_id = NULL, ...) {
  endpoint <- "entries"
  if (!is.null(entry_id)) {
    endpoint <- glue::glue("entries/{entry_id}")
  }
  get_benchling(endpoint, query = ...)
}
