#' List registries
#'
#' List label templates.
#' List printers.
#' Manage registry objects.See our documentation on [how to register
#' entities](https://docs.benchling.com/docs/registering-entities).
#'
#' @param registry_id registries id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{name}{Name of a registry. Restricts results to those with the specified name.}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#' }
#'
#' @return data from `registries` endpoint
#' @export
#'
#' @rdname registries
get_registries <- function(registry_id = NULL, ...) {
  endpoint <- "registries"
  if (!is.null(registry_id)) {
    endpoint <- glue::glue("registries/{registry_id}")
  }
  get_benchling(endpoint, ...)
}
