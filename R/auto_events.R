#' List Events
#'
#' The Events system allows external services to subscribe to events that are
#' triggered in Benchling (e.g. plasmid registration, request submission, etc).
#'
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{nextToken}{Token for pagination}
#'    \item{createdAt.gte}{Datetime, in RFC 3339 format. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. "2020-05-23".}
#'    \item{startingAfter}{Event ID after which events will be returned.}
#'    \item{eventTypes}{Comma-separated list of event types to return.}
#'    \item{poll}{When True, the API will always return a nextToken to enable polling events indefinitely.}
#' }
#'
#' @return data from `events` endpoint
#' @export
#'
#' @rdname events
get_events <- function(...) {
  get_benchling("events", ...)
}
