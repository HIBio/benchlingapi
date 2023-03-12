#' Set Benchling Credentials
#'
#' @param org_var environment variable containing the organisation prefix
#' @param token_var environment variable containing the user API token
#' @param validate When `TRUE` (default: `FALSE`), performs a check to see that
#'   credentials are valid and throws an error if they fail.
#' @return nothing; sets an internal environment variable
#' @export
set_creds <- function(org_var = "BENCHLING_ORG",
                      token_var = "BENCHLING_TOKEN",
                      validate = FALSE) {
  org <- checkmate::assert_string(Sys.getenv(org_var), min.chars = 1L)
  token <- checkmate::assert_string(Sys.getenv(token_var), min.chars = 1L)
  Sys.setenv(BENCHLING_ORG_INTERNAL = org)
  Sys.setenv(BENCHLING_TOKEN_INTERNAL = token)
  if (validate && isFALSE(valid_creds())) {
    stop("Invalid benchling credentials")
  }
  invisible()
}

#' Simple API call to test the current credentials.
#'
#' @export
valid_creds <- function() {
  result <- suppressWarnings(get_users())
  isFALSE(is(result, "response"))
}

#' Get the Configured Benchling Organisation
#'
#' @return the organisation prefix to be used in API calls
#' @export
#'
#' @details
#' if [set_creds()] has not yet been invoked, it will be with the
#' default inputs
get_org <- function() {
  if (Sys.getenv("BENCHLING_ORG_INTERNAL") == "") {
    set_creds()
  }
  Sys.getenv("BENCHLING_ORG_INTERNAL")
}

#' Get the Configured Benchling User API Token
#'
#' @return the user API token to be used in API calls
#' @export
#'
#' @details
#' if [set_creds()] has not yet been invoked, it will be with the
#' default inputs
get_token <- function() {
  if (Sys.getenv("BENCHLING_TOKEN_INTERNAL") == "") {
    set_creds()
  }
  Sys.getenv("BENCHLING_TOKEN_INTERNAL")
}

