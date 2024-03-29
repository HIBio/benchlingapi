#' List users
#'
#' Manage user objects.
#'
#' @param user_id users id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{name}{Name of a user. Restricts results to those with the specified name.}
#'    \item{nameIncludes}{Name substring of a user. Restricts results to those with names that include the provided substring.}
#'    \item{names.anyOf}{Comma-separated list of names. Restricts results to those that match any of the specified names, case insensitive.  Warning - this filter can be non-performant due to case insensitivity.}
#'    \item{names.anyOf.caseSensitive}{Comma-separated list of names. Restricts results to those that match any of the specified names, case sensitive.}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{memberOf}{Comma-separated list of organization and/or team API IDs. Restricts results to users that are members of all given groups.}
#'    \item{adminOf}{Comma-separated list of organization and/or team API IDs. Restricts results to users that are admins of all given groups.}
#'    \item{handles}{Comma-separated list of handles. Restricts results to the users with the specified handles.}
#'    \item{passwordLastChangedAt}{Datetime, in RFC 3339 format. Supports the >, >=, <, <=, operators. Time zone defaults to UTC. Restricts results to users who have last changed their password in the specified range. e.g. > 2017-04-30. If "null" is provided returns users that have no password set (SAML).}
#'    \item{nextToken}{Token for pagination}
#' }
#'
#' @return data from `users` endpoint
#' @export
#'
#' @rdname users
get_users <- function(user_id = NULL, ...) {
  endpoint <- "users"
  if (!is.null(user_id)) {
    endpoint <- glue::glue("users/{user_id}")
  }
  get_benchling(endpoint, ...)
}
