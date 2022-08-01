#' List entries
#'
#' Entries are rich text documents that allow you to capture all of your experimental data in one place.
#'
#' @param entry_id entries id
#'
#' @return data from entries endpoint
#' @export
#'
#' @rdname entries
get_entries <- function(entry_id = NULL) {
  endpoint <- "entries"
  if (!is.null(entry_id)) {
    endpoint <- glue::glue("entries/{entry_id}")
  }
  get_benchling(endpoint)
}

#' List entries
#'
#' Entries are rich text documents that allow you to capture all of your experimental data in one place.
#'
#' @param entry_id entries id
#'
#' @return data from entries endpoint
#' @export
#'
#' @rdname entries
get_entries <- function(entry_id = NULL) {
  endpoint <- "entries"
  if (!is.null(entry_id)) {
    endpoint <- glue::glue("entries/{entry_id}")
  }
  get_benchling(endpoint)
}
