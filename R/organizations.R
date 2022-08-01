#' List organizations
#'
#' View organization objects.
#'
#' @md
#' @param organization_id organizations id
#'
#' @return data from organizations endpoint
#' @export
#'
#' @rdname organizations
get_organizations <- function(organization_id = NULL) {
  endpoint <- "organizations"
  if (!is.null(organization_id)) {
    endpoint <- glue::glue("organizations/{organization_id}")
  }
  get_benchling(endpoint)
}
