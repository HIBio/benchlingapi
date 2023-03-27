#' List organizations
#'
#' View organization objects.
#'
#' @param organization_id organizations id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{name}{Name of an organization. Restricts results to those with the specified name.}
#'    \item{nameIncludes}{Name substring of an organization. Restricts results to those with names that include the provided substring.}
#'    \item{names.anyOf}{Comma-separated list of names. Restricts results to those that match any of the specified names, case insensitive.  Warning - this filter can be non-performant due to case insensitivity.}
#'    \item{names.anyOf.caseSensitive}{Comma-separated list of names. Restricts results to those that match any of the specified names, case sensitive.}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{hasMembers}{Comma-separated list of user or Benchling app IDs. Restricts results to organizations that include all the given users/apps as members.}
#'    \item{hasAdmins}{Comma-separated list of user or Benchling app IDs. Restricts results to organizations that include all the given users/apps as admins.}
#'    \item{nextToken}{Token for pagination}
#' }
#'
#' @return data from `organizations` endpoint
#' @export
#'
#' @rdname organizations
get_organizations <- function(organization_id = NULL, ...) {
  endpoint <- "organizations"
  if (!is.null(organization_id)) {
    endpoint <- glue::glue("organizations/{organization_id}")
  }
  get_benchling(endpoint, ...)
}
