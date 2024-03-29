#' List Oligos
#'
#' Oligos are short linear DNA sequences that can be attached as primers to full
#' DNA sequences. Just like other entities, they support schemas, tags, and
#' aliases.Please migrate to the corresponding DNA Oligos endpoints so that we can
#' support RNA Oligos.
#'
#' @param oligo_id oligos id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{nextToken}{Token for pagination}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{name}{Name of an Oligo. Restricts results to those with the specified name, alias, or entity registry ID.}
#'    \item{bases}{Full bases of the oligo. Restricts results to those with the specified bases, case-insensitive, allowing for circular or reverse complement matches. Does not allow partial matching or loose matching via degenerate bases.}
#'    \item{folderId}{ID of a folder. Restricts results to those in the folder.}
#'    \item{mentionedIn}{Comma-separated list of entry IDs. Restricts results to Oligos mentioned in those entries.}
#'    \item{projectId}{ID of a project. Restricts results to those in the project.}
#'    \item{registryId}{ID of a registry. Restricts results to those registered in this registry. Specifying "null" returns unregistered items.}
#'    \item{schemaId}{ID of a schema. Restricts results to those of the specified schema.}
#'    \item{schemaFields}{Schema field value. For Integer, Float, and Date type fields, supports the >= and <= operators. If present, the schemaId param must also be present. Restricts results to those with a field of whose value matches the filter.}
#'    \item{archiveReason}{Archive reason. Restricts items to those with the specified archive reason. Use "NOT_ARCHIVED" to filter for unarchived Oligos. Use "ANY_ARCHIVED" to filter for archived Oligos regardless of reason. Use "ANY_ARCHIVED_OR_NOT_ARCHIVED" to return items for both archived and unarchived.}
#'    \item{mentions}{Comma-separated list of item IDs. Restricts results to those that mention the given items in the description.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{entityRegistryIds.anyOf}{Comma-separated list of entity registry IDs. Restricts results to those that match any of the specified registry IDs.}
#'    \item{names.anyOf}{Comma-separated list of names. Restricts results to those that match any of the specified names, aliases, or entity registry IDs, case insensitive.  Warning - this filter can be non-performant due to case insensitivity.}
#'    \item{names.anyOf.caseSensitive}{Comma-separated list of names. Restricts results to those that match any of the specified names, aliases, or entity registry IDs, case sensitive.}
#'    \item{creatorIds}{Comma separated list of users IDs}
#' }
#'
#' @return data from `oligos` endpoint
#' @export
#'
#' @rdname oligos
get_oligos <- function(oligo_id = NULL, ...) {
  endpoint <- "oligos"
  if (!is.null(oligo_id)) {
    endpoint <- glue::glue("oligos/{oligo_id}")
  }
  get_benchling(endpoint, ...)
}
