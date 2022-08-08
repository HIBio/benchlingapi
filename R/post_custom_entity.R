#' Add a new custom-entity to the registry
#'
#' @param type type of custom-entity
#' @param name name of the custom-entity
#' @param dry_run set to `TRUE` to actually push to benchling
#' @param ... field entries. See [get_schema_data_by_name()] for details of
#'   which fields the schema requires, with the appropriate `type`
#'
#' @return if `dry_run == TRUE` the response from the server, otherwise `FALSE`
#' @export
new_custom_entity <- function(type = NULL, name = NULL, dry_run = TRUE, ...) {

  schema <- get_schema_id_by_name(type)

  entry_data <- list(...)
  fields_data <- build_fields(entry_data, schema)
  entry_data <- list(
    name = name,
    schemaId = schema$id,
    fields = fields_data,
    registryId = schema$registryID,
    namingStrategy = "NEW_IDS"
  )
  validate_against_schema(entry_data, schema)

  res <- if (!dry_run) {
    post_benchling("custom-entities", entry_data)
  } else {
    message("Dry run only. Constructed data:")
    jsonlite::toJSON(entry_data, auto_unbox = TRUE)
  }

  res
}

build_fields <- function(entry, schema_id) {
  field_names <- names(entry)
  fields <- vector(mode = "list", length = length(field_names))
  names(fields) <- field_names
  schema <- extract_schema_definition(schema_id)
  dropdowns <- schema[schema$type == "dropdown", "name"]
  for (f in seq_along(field_names)) {
    fields[[field_names[f]]] <- if (field_names[f] %in% dropdowns) {
      dropdown_id <- schema[schema$name == field_names[f], "dropdownId"]
      new_val <- get_dropdown_id_from_item_name(dropdown_id, entry[[f]])
      if (!length(new_val)) {
        stop("'",
             field_names[f],
             "' should be one of [",
             toString(get_dropdown_listing(dropdown_id)$name),
             "] but is ",
             entry[[f]])
      }
      if (schema[schema$name == field_names[f], "isMulti"]) {
        list(value = list(new_val))
      } else {
        list(value = new_val)
      }
    } else {
      list(value = entry[[f]])
    }
  }
  fields
}

validate_against_schema <- function(args, schema_id) {
  schema <- extract_schema_definition(schema_id)
  has_archives <- is.data.frame(schema$archiveRecord)
  active_schema <- if (has_archives) {
    schema[is.na(schema$archiveRecord$reason), ]
  } else {
    schema
  }
  arg_names <- active_schema$name
  req_names <- arg_names[active_schema$isRequired]
  if (! all(req_names %in% names(args$fields))) {
   stop(
     "Required fields are: [",
     toString(req_names),
     "]; missing '",
     toString(setdiff(req_names, names(args$fields))),
     "'")
  }
  dropdowns <- active_schema[active_schema$type == "dropdown", ]
  for (item in seq_len(nrow(dropdowns))) {
    dd_name <- dropdowns$name[item]
    arg_value <- unlist(args$fields[[dd_name]]$value)
    dd_options <- get_dropdowns(dropdowns$dropdownId[item])$options
    dd_ids <- dd_options$id
    if(!length(arg_value) || ! arg_value %in% dd_ids) {
      stop("'", dd_name, "' should be one of [", toString(dd_options$name), "] but is ", arg_value)
    }
  }
  TRUE
}

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
  if (!is.null(dd_items$options)) {
    dd_items$options[, c("id", "name")]
  } else {
    all_dropdowns <- get_dropdowns()
    chosen_dd <- all_dropdowns[all_dropdowns$name == dropdown, "id"]
    get_dropdowns(chosen_dd)$options[, c("id", "name")]
  }
}

#' Get a dropdown id from an item
#'
#' @param dropdown id or name of a dropdown
#' @param item name of an item in `dropdown`
#'
#' @return id of the `item` entry in `dropdown`
#' @export
get_dropdown_id_from_item_name <- function(dropdown, item) {
  dd_items <- get_dropdown_listing(dropdown)
  dd_items[dd_items$name == item, "id"]
}

#' Get schema id using schema name
#'
#' @param schema name of a schema
#'
#' @return a `list` with schema name, registryID, and id
#' @export
get_schema_id_by_name <- function(schema) {
  all_schemas <- get_entity_schemas()
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
