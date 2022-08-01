#' List mixtures
#'
#' Mixtures are solutions comprised of multiple ingredients where the exact quantities of each ingredient are important to track. Each ingredient is uniquely identified by its component entity.
#'
#' @param mixture_id mixtures id
#'
#' @return data from mixtures endpoint
#' @export
#'
#' @rdname mixtures
get_mixtures <- function(mixture_id = NULL) {
  endpoint <- "mixtures"
  if (!is.null(mixture_id)) {
    endpoint <- glue::glue("mixtures/{mixture_id}")
  }
  get_benchling(endpoint)
}
