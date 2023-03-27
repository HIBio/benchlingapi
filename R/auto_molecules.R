#' List Molecules
#'
#' Molecules are groups of atoms held together by bonds, representing entities
#' smaller than DNA Sequences and AA Sequences. Just like other entities, they
#' support schemas, tags, and aliases.
#'
#' @param molecule_id molecules id
#' @param ... additional query parameters; see Details below
#'
#' @details
#' Available query parameters:
#' \describe{
#'    \item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
#'    \item{nextToken}{Token for pagination}
#'    \item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
#'    \item{name}{Name of a Molecule. Restricts results to those with the specified name, alias, or entity registry ID.}
#'    \item{nameIncludes}{Name substring of a Molecule. Restricts results to those with names, aliases, or entity registry IDs that include the provided substring.}
#'    \item{folderId}{ID of a folder. Restricts results to those in the folder.}
#'    \item{mentionedIn}{Comma-separated list of entry IDs. Restricts results to Molecules mentioned in those entries.}
#'    \item{projectId}{ID of a project. Restricts results to those in the project.}
#'    \item{registryId}{ID of a registry. Restricts results to those registered in this registry. Specifying "null" returns unregistered items.}
#'    \item{schemaId}{ID of a schema. Restricts results to those of the specified schema.}
#'    \item{schemaFields}{Schema field value. For Integer, Float, and Date type fields, supports the >= and <= operators. If present, the schemaId param must also be present. Restricts results to those with a field of whose value matches the filter.}
#'    \item{archiveReason}{Archive reason. Restricts results to those with the specified archive reason. Use “NOT_ARCHIVED” to filter for unarchived Molecules. Use "ANY_ARCHIVED" to filter for archived Molecules regardless of reason. Use "ANY_ARCHIVED_OR_NOT_ARCHIVED" to return items for both archived and unarchived.}
#'    \item{mentions}{Comma-separated list of item IDs. Restricts results to those that mention the given items in the description.}
#'    \item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
#'    \item{entityRegistryIds.anyOf}{Comma-separated list of entity registry IDs. Restricts results to those that match any of the specified registry IDs.}
#'    \item{names.anyOf}{Comma-separated list of names. Restricts results to those that match any of the specified names, aliases, or entity registry IDs.}
#'    \item{authorIds.anyOf}{Comma separated list of user or app IDs}
#'    \item{chemicalSubstructure.mol}{mol-formatted string for a chemical substructure to search by}
#'    \item{chemicalSubstructure.smiles}{SMILES string for a chemical substructure to search by}
#' }
#'
#' @return data from `molecules` endpoint
#' @export
#'
#' @rdname molecules
get_molecules <- function(molecule_id = NULL, ...) {
  endpoint <- "molecules"
  if (!is.null(molecule_id)) {
    endpoint <- glue::glue("molecules/{molecule_id}")
  }
  get_benchling(endpoint, ...)
}
