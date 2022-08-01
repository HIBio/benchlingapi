#' List teams
#'
#' View team objects.
#'
#' @param team_id teams id
#'
#' @return data from teams endpoint
#' @export
#'
#' @rdname teams
get_teams <- function(team_id = NULL) {
  endpoint <- "teams"
  if (!is.null(team_id)) {
    endpoint <- glue::glue("teams/{team_id}")
  }
  get_benchling(endpoint)
}
