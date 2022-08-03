#' List apps
#'
#' Create and manage Benchling apps on your tenant
#'
#' @param app_id apps id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{pageSize}{Number of results to return.}
#'    \item{nextToken}{Token for pagination}
#'    \item{sort}{Method by which to order search results. Valid sorts are modifiedAt (modified time, most recent first) and name (app name, alphabetical). Optionally add :asc or :desc to specify ascending or descending order. Default is modifiedAt.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{name}{Name of an app. Restricts results to those with the specified name.}
#'    \item{nameIncludes}{Name substring of an app. Restricts results to those with names that include the provided substring.}
#'    \item{names.anyOf}{Comma-separated list of app names. Restricts results to those that match any of the specified names, case insensitive.  Warning - this filter can be non-performant due to case insensitivity.}
#'    \item{names.anyOf.caseSensitive}{Comma-separated list of app names. Restricts results to those that match any of the specified names, case sensitive.}
#'    \item{creatorIds}{Comma separated list of users IDs}
#'    \item{memberOf}{Comma-separated list of organization and/or team API IDs. Restricts results to apps that are members of all given groups.}
#'    \item{adminOf}{Comma-separated list of organization and/or team API IDs. Restricts results to apps that are admins of all given groups.}
#' }
#'
#' @return data from `apps` endpoint
#' @export
#'
#' @rdname apps
get_apps <- function(app_id = NULL, ...) {
  endpoint <- "apps"
  if (!is.null(app_id)) {
    endpoint <- glue::glue("apps/{app_id}")
  }
  get_benchling(endpoint, query = ...)
}
