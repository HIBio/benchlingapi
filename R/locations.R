#' List locations
#'
#' Manage locations objects.Like all storage, every Location has a barcode that is unique across the registry.
#'
#' @param location_id locations id
#'
#' @return data from locations endpoint
#' @export
#'
#' @rdname locations
get_locations <- function(location_id = NULL) {
  endpoint <- "locations"
  if (!is.null(location_id)) {
    endpoint <- glue::glue("locations/{location_id}")
  }
  get_benchling(endpoint)
}
