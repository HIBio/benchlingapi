#' List containers
#'
#' Containers are the backbone of sample management in Benchling. They represent physical containers, such as tubes or wells, that hold quantities of biological samples (represented by the batches inside the container). The container itself tracks its total volume, and the concentration of every batch inside of it.Containers are all associated with schemas, which define the type of the container (e.g. "Tube") along with the fields that are tracked.Like all storage, every container has a barcode that is unique across the registry.
#'
#' @param container_id containers id
#'
#' @return data from containers endpoint
#' @export
#'
#' @rdname containers
get_containers <- function(container_id = NULL) {
  endpoint <- "containers"
  if (!is.null(container_id)) {
    endpoint <- glue::glue("containers/{container_id}")
  }
  get_benchling(endpoint)
}

