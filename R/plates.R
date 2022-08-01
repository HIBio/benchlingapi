#' List plates
#'
#' Plates are a structured storage type, grids of wells that each function like
#' containers. Plates come in two types: a traditional "fixed" type, where the
#' wells cannot move, and a "matrix" type. A matrix plate has similar
#' functionality to a box, where the containers inside can be moved around and
#' removed altogether.Plates are all associated with schemas, which define the
#' type of the plate (e.g. "96 Well Plate") along with the fields that are
#' tracked, the dimensions of the plate, and whether or not the plate is a matrix
#' plate or a traditional well plate.Like all storage, every Plate has a barcode
#' that is unique across the registry.
#'
#' @md
#' @param plate_id plates id
#'
#' @return data from plates endpoint
#' @export
#'
#' @rdname plates
get_plates <- function(plate_id = NULL) {
  endpoint <- "plates"
  if (!is.null(plate_id)) {
    endpoint <- glue::glue("plates/{plate_id}")
  }
  get_benchling(endpoint)
}
