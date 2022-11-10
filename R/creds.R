#' Set Benchling Credentials
#'
#' @param org_var environment variable containing the organisation prefix
#' @param token_var environment variable containing the user API token
#'
#' @return nothing; sets an internal environment variable
#' @export
set_creds <- function(org_var = "BENCHLING_ORG",
                      token_var = "BENCHLING_TOKEN") {
  Sys.setenv(BENCHLING_ORG_INTERNAL = Sys.getenv(org_var))
  Sys.setenv(BENCHLING_TOKEN_INTERNAL = Sys.getenv(token_var))
  invisible()
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

