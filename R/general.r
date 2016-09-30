#' Does the environment variable exist?
#' @export
has_env <- function(x) !identical(Sys.getenv(x), "")

#' get last element
#' @export
last_el <- function(x) {
  if (length(x) < 1) return(x)
  x[[length(x)]]
}
