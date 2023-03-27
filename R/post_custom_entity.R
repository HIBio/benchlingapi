#' Add a new custom-entity to the registry
#'
#' @param type type of custom-entity
#' @param name name of the custom-entity
#' @param id id of the custom-entity. If provided, this will be used as the
#'   `entityRegistryId`, otherwise the `namingStrategy` used will be `"NEW_IDS"`
#' @param dry_run set to `TRUE` to actually push to benchling
#' @param ... field entries. See [get_schema_data_by_name()] for details of
#'   which fields the schema requires, with the appropriate `type`
#'
#' @return if `dry_run == TRUE` the response from the server, otherwise `FALSE`
#' @export
new_custom_entity <- function(type = NULL, name = NULL, id = NULL, dry_run = TRUE, ...) {
  schema <- get_schema_id_by_name(type)

  entry_data <- list(...)
  fields_data <- build_fields(entry_data, schema)
  entry_data <- list(
    name = name,
    schemaId = schema$id,
    fields = fields_data,
    registryId = schema$registryID
  )

  if (!is.null(id)) {
    entry_data <- c(entry_data,
      entityRegistryId = id
    )
  } else {
    entry_data <- c(entry_data,
      namingStrategy = "NEW_IDS"
    )
  }

  validate_against_schema(entry_data, schema)

  res <- if (!dry_run) {
    post_benchling("custom-entities", entry_data)
  } else {
    message("Dry run only. Constructed data:")
    print(jsonlite::toJSON(entry_data, auto_unbox = TRUE))
  }

  res
}

#' Update custom-entity
#'
#' @param custom_entity_id registry ID of entity to update
#' @param name name of entity to be set
#' @param aliases alias of entity to be set
#' @param authorIds author ID(s) of entity to be set
#' @param customFields custom Fields of entity to be set (as a named list)
#' @param fields fields of entity to be set (as a named list)
#' @param folderId folder of entity to be set
#' @param entityRegistryId registry ID of entity to be set
#'
#' @return if `dry_run == TRUE` the response from the server, otherwise `FALSE`
#' @export
update_custom_entity <- function(custom_entity_id = NULL,
                                 name = NULL,
                                 aliases = NULL,
                                 authorIds = NULL,
                                 customFields = NULL,
                                 fields = NULL,
                                 folderId = NULL,
                                 entityRegistryId = NULL,
                                 dry_run = TRUE,
                                 ...) {
  stopifnot(!is.null(custom_entity_id))
  this_entity <- get_custom_entities(custom_entity_id)

  entry_data <- list()
  if (!is.null(name)) entry_data <- c(entry_data, name = name)
  if (!is.null(aliases)) entry_data <- c(entry_data, aliases = aliases)
  if (!is.null(authorIds)) entry_data <- c(entry_data, authorIds = authorIds)
  if (!is.null(customFields)) entry_data <- c(entry_data, customFields = customFields)
  if (!is.null(fields)) entry_data <- c(entry_data, fields = list(build_fields(fields, this_entity$schema$id)))
  if (!is.null(folderId)) entry_data <- c(entry_data, folderId = folderId)
  if (!is.null(entityRegistryId)) entry_data <- c(entry_data, entityRegistryId = entityRegistryId)

  res <- if (!dry_run) {
    post_benchling(glue::glue("custom-entities/{custom_entity_id}"), entry_data, f = "PATCH")
  } else {
    message("Dry run only. Constructed data;")
    print(jsonlite::toJSON(entry_data, auto_unbox = TRUE))
  }

  res
}


build_fields <- function(entry, schema_id) {
  ## drop any already missing fields
  entry <- entry[sapply(entry, Negate(is.null))]
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
        stop(
          "'",
          field_names[f],
          "' should be one of [",
          toString(get_dropdown_listing(dropdown_id)$name),
          "] but is ",
          entry[[f]]
        )
      }
      if (schema[schema$name == field_names[f], "isMulti"]) {
        list(value = unlist(new_val))
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
  has_archives <- utils::hasName(schema, "archiveRecord.reason")
  active_schema <- if (has_archives) {
    schema[is.na(schema$archiveRecord.reason), ]
  } else {
    schema
  }
  arg_names <- active_schema$name
  req_names <- arg_names[active_schema$isRequired]
  if (!all(req_names %in% names(args$fields))) {
    stop(
      "Required fields are: [",
      toString(req_names),
      "]; missing '",
      toString(setdiff(req_names, names(args$fields))),
      "'"
    )
  }
  dropdowns <- active_schema[active_schema$type == "dropdown", ]
  for (item in seq_len(nrow(dropdowns))) {
    dd_name <- dropdowns$name[item]
    arg_value <- unlist(args$fields[[dd_name]]$value)
    dd_options <- get_dropdowns(dropdowns$dropdownId[item])$options
    dd_ids <- dd_options$id
    if (!length(arg_value) || !all(arg_value %in% dd_ids)) {
      if (dd_name %in% req_names) {
        stop("'", dd_name, "' should be one of [", toString(dd_options$name), "] but is ", arg_value)
      } else {
        warning("'", dd_name, "' is not required, but should be one of [", toString(dd_options$name), "] but is ", arg_value)
      }
    }
  }
  TRUE
}
