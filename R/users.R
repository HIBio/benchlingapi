#' List users
#'
#' View user objects.
#'
#' @param user_id users id
#'
#' @return data from users endpoint
#' @export
#'
#' @rdname users
get_users <- function(user_id = NULL) {
  endpoint <- "users"
  if (!is.null(user_id)) {
    endpoint <- glue::glue("users/{user_id}")
  }
  get_benchling(endpoint)
}

