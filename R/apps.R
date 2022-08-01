#' List apps
#'
#' Create and manage Benchling apps on your tenant
#'
#' @param app_id apps id
#'
#' @return data from apps endpoint
#' @export
#'
#' @rdname apps
get_apps <- function(app_id = NULL) {
  endpoint <- "apps"
  if (!is.null(app_id)) {
    endpoint <- glue::glue("apps/{app_id}")
  }
  get_benchling(endpoint)
}

