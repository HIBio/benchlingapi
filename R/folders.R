#' List folders
#'
#' Manage folder objects.
#'
#' @param folder_id folders id
#'
#' @return data from folders endpoint
#' @export
#'
#' @rdname folders
get_folders <- function(folder_id = NULL) {
  endpoint <- "folders"
  if (!is.null(folder_id)) {
    endpoint <- glue::glue("folders/{folder_id}")
  }
  get_benchling(endpoint)
}

