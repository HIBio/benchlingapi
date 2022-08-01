#' List entry templates
#'
#' Entries are rich text documents that allow you to capture all of your experimental data in one place.
#'
#' @param entry_template_id entry_templates id
#'
#' @return data from entry_templates endpoint
#' @export
#'
#' @rdname entry_templates
get_entry_templates <- function(entry_template_id = NULL) {
  endpoint <- "entry_templates"
  if (!is.null(entry_template_id)) {
    endpoint <- glue::glue("entry_templates/{entry_template_id}")
  }
  get_benchling(endpoint)
}

