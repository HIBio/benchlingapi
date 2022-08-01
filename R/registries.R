#' List registries
#'
#' List label templates.
#'
#' @param registry_id registries id
#'
#' @return data from registries endpoint
#' @export
#'
#' @rdname registries
get_registries <- function(registry_id = NULL) {
  endpoint <- "registries"
  if (!is.null(registry_id)) {
    endpoint <- glue::glue("registries/{registry_id}")
  }
  get_benchling(endpoint)
}

 #' List registries
#'
#' List printers.
#'
#' @param registry_id registries id
#'
#' @return data from registries endpoint
#' @export
#'
#' @rdname registries
get_registries <- function(registry_id = NULL) {
  endpoint <- "registries"
  if (!is.null(registry_id)) {
    endpoint <- glue::glue("registries/{registry_id}")
  }
  get_benchling(endpoint)
}

 #' List registries
#'
#' Manage registry objects.See our documentation on [how to register entities](https://docs.benchling.com/docs/registering-entities).
#'
#' @param registry_id registries id
#'
#' @return data from registries endpoint
#' @export
#'
#' @rdname registries
get_registries <- function(registry_id = NULL) {
  endpoint <- "registries"
  if (!is.null(registry_id)) {
    endpoint <- glue::glue("registries/{registry_id}")
  }
  get_benchling(endpoint)
}

