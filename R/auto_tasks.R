#' Tasks
#'
#' Endpoints that perform expensive computations launch long-running tasks. These
#' endpoints return the task ID (a UUID) in the response body.After launching a
#' task, periodically invoke the [Get a task](#/Tasks/getTask) endpoint with the
#' task UUID (e.g., every 10 seconds), until the status is no longer RUNNING.You
#' can access a task for up to 30 minutes after its completion, after which its
#' data will no longer be available.
#'
#' @param task_id tasks id
#' @param ... (ignored)
#'
#' @return data from `tasks` endpoint
#' @export
#'
#' @rdname tasks
get_tasks <- function(task_id = NULL, ...) {
  endpoint <- "tasks"
  if (!is.null(task_id)) {
    endpoint <- glue::glue("tasks/{task_id}")
  }
  get_benchling(endpoint, ...)
}
