#' Does the environment variable exist?
#' @export
has_env_var <- function(x) !identical(Sys.getenv(x), "")

#' get last element
#' @export
last <- function(x) {
  if (length(x) < 1) return(x)
  x[[length(x)]]
}
