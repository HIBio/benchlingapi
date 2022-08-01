#' List entry templates
#'
#' Entries are rich text documents that allow you to capture all of your
#' experimental data in one place.
#'
#' @md
#' @param entry_template_id entry_templates id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{nextToken}{Token for pagination}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{name}{Name of an Entry Template. Restricts results to those with the specified name.}
#'    \item{templateCollectionId}{ID of a template collection. Resticts results to those in the template collection.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{schemaId}{ID of a schema. Restricts results to those of the specified schema.}
#' }
#'
#' @return data from `entry_templates` endpoint
#' @export
#'
#' @rdname entry_templates
get_entry_templates <- function(entry_template_id = NULL, ...) {
  endpoint <- "entry_templates"
  if (!is.null(entry_template_id)) {
    endpoint <- glue::glue("entry_templates/{entry_template_id}")
  }
  get_benchling(endpoint, query = ...)
}
