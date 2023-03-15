#' Get dropdown listing
#'
#' @param dropdown name or id of a dropdown
#'
#' @return a two-column `data.frame` containing the ids and names of the items
#'   in `dropdown`
#' @export
get_dropdown_listing <- function(dropdown) {
  # try dropdown as ID
  dd_items <- suppressWarnings(get_dropdowns(dropdown))
  if (!inherits(dd_items, "response")) {
    dd_items[, c("id", "name")]
  } else {
    all_dropdowns <- get_dropdowns(pageSize = 500, quiet = TRUE)
    chosen_dd <- all_dropdowns[all_dropdowns$name == dropdown, "id"]
    get_dropdowns(chosen_dd)[, c("id", "name")]
  }
}

#' Get a dropdown id from an item
#'
#' @param dropdown id or name of a dropdown
#' @param itemname name of an item in `dropdown`
#'
#' @return id of the `item` entry in `dropdown`
#' @export
get_dropdown_id_from_item_name <- function(dropdown, itemname) {
  dd_items <- get_dropdown_listing(dropdown)
  dd_items[dd_items$name %in% itemname, "id"]
}

#' Get schema id using schema name
#'
#' @param schema name of a schema
#'
#' @return a `list` with schema name, registryID, and id
#' @export
get_schema_id_by_name <- function(schema) {
  all_schemas <- get_entity_schemas()
  if (!schema %in% all_schemas$name) {
    msg <- paste("Unable to find that schema by name.")
    similar <- agrep(schema, all_schemas$name, value = TRUE, ignore.case = TRUE)
    if (length(similar) == 0) {
      stop(msg)
    } else {
      msg <- paste(
        paste(msg,
              "  Possible matches: ",
              sep = "\n"),
        paste(similar, collapse = "\n"),
        sep = "\n")

      stop(msg)
    }
  }
  s <- all_schemas[all_schemas$name == schema, ]
  list(name = schema, registryID = s$registryId, id = s$id)
}

#' Get schema data using schema name
#'
#' @param schema name of a schema
#'
#' @return a data.frame of schema definition
#' @export
get_schema_data_by_name <- function(schema) {
  get_schema_id_by_name(schema) |>
    extract_schema_definition()
}
