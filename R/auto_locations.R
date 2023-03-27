#' List locations
#'
#' Manage locations objects.Like all inventory, every Location has a barcode that
#' is unique across the registry.
#'
#' @param location_id locations id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{pageSize}{Number of results to return.}
#'    \item{nextToken}{Token for pagination}
#'    \item{sort}{Method by which to order search results. Valid sorts are barcode (barcode, alphabetical) modifiedAt (modified time, most recent first) and name (location name, alphabetical). Optionally add :asc or :desc to specify ascending or descending order. Default is modifiedAt.}
#'    \item{schemaId}{ID of a schema. Restricts results to those of the specified schema.}
#'    \item{schemaFields}{Schema field value. For Integer, Float, and Date type fields, supports the >= and <= operators. If present, the schemaId param must also be present. Restricts results to those with a field of whose value matches the filter.}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{name}{Name of a location. Restricts results to those with the specified name.}
#'    \item{nameIncludes}{Name substring of a location. Restricts results to those with names that include the provided substring.}
#'    \item{ancestorStorageId}{ID of a plate, box, or location. Restricts results to those located in the specified inventory.}
#'    \item{archiveReason}{Archive reason. Restricts items to those with the specified archive reason. Use "NOT_ARCHIVED" to filter for unarchived locations. Use "ANY_ARCHIVED" to filter for archived locations regardless of reason. Use "ANY_ARCHIVED_OR_NOT_ARCHIVED" to return items for both archived and unarchived.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{barcodes}{Comma-separated list of barcodes. Matches all of the provided barcodes, or returns a 400 error that includes a list of which barcodes are invalid.}
#'    \item{names.anyOf}{Comma-separated list of names. Restricts results to those that match any of the specified names, case insensitive.  Warning - this filter can be non-performant due to case insensitivity.}
#'    \item{names.anyOf.caseSensitive}{Comma-separated list of names. Restricts results to those that match any of the specified names, case sensitive.}
#'    \item{creatorIds}{Comma separated list of users IDs}
#' }
#'
#' @return data from `locations` endpoint
#' @export
#'
#' @rdname locations
get_locations <- function(location_id = NULL, ...) {
  endpoint <- "locations"
  if (!is.null(location_id)) {
    endpoint <- glue::glue("locations/{location_id}")
  }
  get_benchling(endpoint, ...)
}
