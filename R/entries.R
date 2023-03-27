#' Get Note Entry Using ID
#'
#' @param displayId displayId of note entry (starting with `EXP`)
#'
#' @return data from `entries` endpoint. For more flexibility, use [get_entries()]
#' @export
get_entry_by_id <- function(displayId = NULL) {
  get_entries(displayIds = displayId)
}

#' Get Note Entry Attachments
#'
#' @param entry_id entries id
#' @param annotateURL should the `downloadURL` and `size` be annotated? This
#'   requires an additional query
#'
#' @return a [tibble::tibble()] containing the name of the attachment (`text`),
#'   `externalFileId`, and if `annotateURL`, the `downloadURL` (for the given
#'   user - containing API keys) and `size`
#' @export
get_attachments <- function(entry_id, annotateURL = TRUE) {
  entry <- get_entries(entry_id)
  att <- dplyr::filter(entry$entry$days$notes[[1]], type == "external_file")
  att <- att[, c("text", "externalFileId")]
  if (annotateURL && nrow(att) > 0) {
    att$downloadURL <- NA
    att$size <- NA
    for (i in seq_len(nrow(att))) {
      efid <- att[i, "externalFileId", drop = TRUE]
      att_meta <- get_benchling(
        glue::glue("entries/{entry_id}/external-files/{efid}")
      )$externalFile
      att[i, "downloadURL"] <- att_meta$downloadURL
      att[i, "size"] <- att_meta$size
    }
  }
  tibble::as_tibble(att)
}

#' Get Note Entry Tables
#'
#' @param entry_id entries id
#'
#' @return a [tibble::tibble()] containing the `name` of the table,
#'   `columnLabels`, and `rows`, nested appropriately
#'
#' @details
#'
#' Note that this cannot return the contents of a `lookup_table`.
#'
#' Expand the contents of a table with [extract_table()], e.g.
#' ```
#' x <- get_tables(entry_id)
#' extract_table(x[1, ])
#' ```
#'
#' @export
get_tables <- function(entry_id) {
  entry <- get_entries(entry_id)
  if (inherits(entry, "response")) {
    stop(httr::content(entry)$error$message)
  }
  dplyr::filter(entry$entry$days$notes[[1]], type == "table") |>
    dplyr::select(dplyr::starts_with("table")) |>
    tibble::as_tibble() |>
    dplyr::rename_with(~ sub("table.", "", .x, fixed = TRUE))
}

#' Extract Contents of an Entry Table
#'
#' @param tbl_contents either a `[tibble::tibble()]` or one row of one from
#'   [get_tables()] containing the nested data
#' @param name name of table to extract (when more than one available)
#'
#' @return a [tibble::tibble()] of the table contents
#' @export
extract_table <- function(tbl_contents, name = NULL) {
  nm <- tbl_contents$name
  if (length(nm) > 1) {
    if (is.null(name)) {
      msg <- paste("Provide the `name` of the table you wish to extract.",
        paste0("  Options are: ", toString(nm)),
        sep = "\n"
      )
      stop(msg)
    }
    tbl_contents <- tbl_contents[tbl_contents$name == name, , drop = FALSE]
  }
  cl <- unlist(tbl_contents$columnLabels)
  tb_rows <- tbl_contents$rows[[1]]
  tb <- purrr::map_dfr(tb_rows[[1]], unlist)
  colnames(tb) <- cl
  tb
}

#' Get Note Lookup Table (Structure)
#'
#' @param entry_id entries id
#'
#' @return a [tibble::tibble()] containing the lookup table names and Ids
#'
#' @details
#'
#' Note: extract the contents with e.g.
#' ```
#' x <- get_lookup_tables(entry_id)
#' x$columns[[1]]
#' ```
#' which returns the `columnId` and `name` but no contents.
#'
#' @export
get_lookup_tables <- function(entry_id) {
  entry <- get_entries(entry_id)
  res <- dplyr::filter(entry$entry$days$notes[[1]], type == "lookup_table")
  tibble::as_tibble(
    res[, c("apiId", "columns")]
  )
}
