#' List projects
#'
#' Manage project objects.
#'
#' @md
#' @param project_id projects id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{sort}{Method by which to order search results. Valid sorts are modifiedAt (modified time, most recent first) and name (project name, alphabetical). Optionally add :asc or :desc to specify ascending or descending order. Default is modifiedAt.}
#'    \item{archiveReason}{Archive reason. Restricts items to those with the specified archive reason. Use "NOT_ARCHIVED" to filter for unarchived projects. Use "ANY_ARCHIVED" to filter for archived projects regardless of reason. Use "ANY_ARCHIVED_OR_NOT_ARCHIVED" to return items for both archived and unarchived.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{name}{Name of a project. Restricts results to those with the specified name.}
#' }
#' 
#' @return data from `projects` endpoint
#' @export
#'
#' @rdname projects
get_projects <- function(project_id = NULL, ...) {
  endpoint <- "projects"
  if (!is.null(project_id)) {
    endpoint <- glue::glue("projects/{project_id}")
  }
  get_benchling(endpoint, query = ...)
}

