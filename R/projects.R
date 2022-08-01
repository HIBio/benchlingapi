#' List projects
#'
#' Manage project objects.
#'
#' @param project_id projects id
#'
#' @return data from projects endpoint
#' @export
#'
#' @rdname projects
get_projects <- function(project_id = NULL) {
  endpoint <- "projects"
  if (!is.null(project_id)) {
    endpoint <- glue::glue("projects/{project_id}")
  }
  get_benchling(endpoint)
}

