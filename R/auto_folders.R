#' List folders
#'
#' Manage folder objects.
#'
#' @md
#' @param folder_id folders id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{sort}{Method by which to order search results. Valid sorts are modifiedAt (modified time, most recent first) and name (folder name, alphabetical). Optionally add :asc or :desc to specify ascending or descending order.}
#'    \item{archiveReason}{Archive reason. Restricts items to those with the specified archive reason. Use "NOT_ARCHIVED" to filter for unarchived folders. Use "ANY_ARCHIVED" to filter for archived folders regardless of reason. Use "ANY_ARCHIVED_OR_NOT_ARCHIVED" to return items for both archived and unarchived.}
#'    \item{nameIncludes}{Name substring of a folder. Restricts results to those with names that include the provided substring.}
#'    \item{parentFolderId}{ID of a folder. Restricts results to those in the folder. Use "NO_PARENT" to filter for root folders.}
#'    \item{projectId}{ID of a project. Restricts results to those in the project.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{name}{Name of a folder. Restricts results to those with the specified name.}
#'    \item{section}{INVENTORY or NOTEBOOK. Returns folders of inventory type or notebook type. Returns all folders if sections are merged.}
#' }
#'
#' @return data from `folders` endpoint
#' @export
#'
#' @rdname folders
get_folders <- function(folder_id = NULL, ...) {
  endpoint <- "folders"
  if (!is.null(folder_id)) {
    endpoint <- glue::glue("folders/{folder_id}")
  }
  get_benchling(endpoint, query = ...)
}
