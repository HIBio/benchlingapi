#' List Events
#'
#' The Events system allows external services to subscribe to events that are
#' triggered in Benchling (e.g. plasmid registration, request submission, etc).
#'
#' @md
#' @return data from events endpoint
#' @export
#'
#' @rdname events
get_events <- function() {
  get_benchling(events)
}

