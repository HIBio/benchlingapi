tidy_fields <- function(content) {
  fields <- tibble::enframe(content$fields) |>
    tidyr::unnest_wider("value")
  content$fields <- fields
  content
}

structure_or_id <- function(x) {
  if (is.character(x)) {
    x
  } else if (is.list(x)) {
    x$id
  } else {
    stop("Unrecognised format")
  }
}

#' Extract entity schema definition
#'
#' @param entity entity id or object returned from [get_custom_entities()]
#' @param quiet should the entity and schema IDs be printed?
#'
#' @return a [tibble::tibble()] representing the schema
#' @export
#'
#' @examples
#' ent_id <- get_custom_entities()$id[1]
#' extract_entity_schema_definition(ent_id)
#' get_custom_entities(ent_id) |>
#'    extract_entity_schema_definition()
extract_entity_schema_definition <- function(entity, quiet = FALSE) {
  entity_id <- structure_or_id(entity)
  schema_id <- get_custom_entities(entity_id)$schema$id
  if (!quiet) message("entity ", entity_id, " is defined by schema ", schema_id)
  extract_schema_definition(schema_id)
}

#' Extract schema definition
#'
#' @param schema_id schema id or object returned from [get_entity_schemas()]
#'
#' @return a [tibble::tibble()] representing the schema
#' @export
#'
#' @examples
#' sch_id <- get_entity_schemas()$id[1]
#' extract_schema_definition(sch_id)
#' get_entity_schemas(sch_id) |>
#'    extract_schema_definition()
extract_schema_definition <- function(schema_id) {
  schema_id <- structure_or_id(schema_id)
  get_entity_schemas(schema_id)$fieldDefinition
}

#' Extract entity data fields
#'
#' @param entity_id entity id or object returned from [get_custom_entities()]
#'
#' @return a [tibble::tibble()] representing the entity data and relevant classes
#' @export
#'
#' @examples
#' ent_id <- get_custom_entities()$id[1]
#' extract_entity_fields(ent_id)
#' get_custom_entities(ent_id) |>
#"    extract_entity_fields()
extract_entity_fields <- function(entity_id) {
  entity_id <- structure_or_id(entity_id)
  tidy_fields <- get_custom_entities(entity_id) |>
    tidy_fields()
  # order rows using the schema
  schema <- extract_entity_schema_definition(entity_id)
  tidy_fields$fields |>
    dplyr::select(
      name = .data$name,
      value = .data$displayValue,
      id = .data$value,
      class = .data$type
    ) |>
  dplyr::arrange(match(name, schema$name))
}

#' List custom entities
#'
#' @param type schema name of custom entities
#' @param print_fields fields to print (all data is returned, invisibly). Set to
#'   `NULL` to skip printing
#'
#' @return (invisibly) custom entity data as a nested `data.frame`. The fields
#'   `print_fields` are printed to the console for simplicity (unless overridden)
#' @export
list_custom_entities <- function(type, print_fields = c("id", "name")) {
  schema <- get_schema_id_by_name(type)
  entities <- get_custom_entities(schemaId = schema$id)
  if (!is.null(print_fields)) {
    print(entities[, print_fields])
  }
  invisible(entities)
}

