#' List mixtures
#'
#' Mixtures are solutions comprised of multiple ingredients where the exact
#' quantities of each ingredient are important to track. Each ingredient is
#' uniquely identified by its component entity.
#'
#' @param mixture_id mixtures id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{name}{Name of a mixture. Restricts results to those with the specified name, alias, or entity registry ID.}
#'    \item{nameIncludes}{Name substring of a mixture. Restricts results to those with names, aliases, or entity registry IDs that include the provided substring.}
#'    \item{folderId}{ID of a folder. Restricts results to those in the folder.}
#'    \item{mentionedIn}{Comma-separated list of entry IDs. Restricts results to mixtures mentioned in those entries.}
#'    \item{projectId}{ID of a project. Restricts results to those in the project.}
#'    \item{registryId}{ID of a registry. Restricts results to those registered in this registry. Specifying "null" returns unregistered items.}
#'    \item{schemaId}{ID of a schema. Restricts results to those of the specified schema.}
#'    \item{schemaFields}{Schema field value. For Integer, Float, and Date type fields, supports the >= and <= operators. If present, the schemaId param must also be present. Restricts results to those with a field of whose value matches the filter.}
#'    \item{archiveReason}{Archive reason. Restricts items to those with the specified archive reason. Use "NOT_ARCHIVED" to filter for unarchived mixtures. Use "ANY_ARCHIVED" to filter for archived mixtures regardless of reason. Use "ANY_ARCHIVED_OR_NOT_ARCHIVED" to return items for both archived and unarchived.}
#'    \item{mentions}{Comma-separated list of resource IDs. Restricts results to those that mention the given items in the description.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{names.anyOf}{Comma-separated list of names. Restricts results to those that match any of the specified names, aliases, or entity registry IDs, case insensitive.  Warning - this filter can be non-performant due to case insensitivity.}
#'    \item{names.anyOf.caseSensitive}{Comma-separated list of names. Restricts results to those that match any of the specified names, aliases, or entity registry IDs, case sensitive.}
#'    \item{entityRegistryIds.anyOf}{Comma-separated list of entity registry IDs. Restricts results to those that match any of the specified registry IDs.}
#'    \item{ingredientComponentEntityIds}{Comma-separated list of ingredient component entity ids. Matches all mixtures that contain ingredients whose component entities match all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{ingredientComponentEntityIds.anyOf}{Comma-separated list of ingredient component entity ids. Matches all mixtures that contain ingredients whose component entities match any of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{authorIds.anyOf}{Comma separated list of user or app IDs}
#' }
#'
#' @return data from `mixtures` endpoint
#' @export
#'
#' @rdname mixtures
get_mixtures <- function(mixture_id = NULL, ...) {
  endpoint <- "mixtures"
  if (!is.null(mixture_id)) {
    endpoint <- glue::glue("mixtures/{mixture_id}")
  }
  get_benchling(endpoint, ...)
}
