#' List batches
#'
#' Batches represent physical quantities of a sequence, protein, or other
#' biological entity. A batch is identified by its biological entity's name (or
#' Registry ID, if the entity is registered), its date of creation, and an
#' optional inventory number.
#'
#' @param batch_id batches id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{nextToken}{Token for pagination}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{schemaId}{ID of a schema. Restricts results to those of the specified schema.}
#'    \item{schemaFields}{Schema field value. For Integer, Float, and Date type fields, supports the >= and <= operators. If present, the schemaId param must also be present. Restricts results to those with a field of whose value matches the filter.}
#'    \item{archiveReason}{Archive reason. Restricts items to those with the specified archive reason. Use "NOT_ARCHIVED" to filter for unarchived batches. Use "ANY_ARCHIVED" to filter for archived batches regardless of reason. Use "ANY_ARCHIVED_OR_NOT_ARCHIVED" to return items for both archived and unarchived.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{creatorIds}{Comma separated list of users IDs}
#' }
#'
#' @return data from `batches` endpoint
#' @export
#'
#' @rdname batches
get_batches <- function(batch_id = NULL, ...) {
  endpoint <- "batches"
  if (!is.null(batch_id)) {
    endpoint <- glue::glue("batches/{batch_id}")
  }
  get_benchling(endpoint, ...)
}
