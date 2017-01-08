#' Is a host listening on a port (TCP)?
#'
#' Given a vector of hosts (or IPs) and ports (or a single port)
#' this function will test whether the node(s) is/are listening for
#' connections. Fully vectorized with customizable timeouts and options
#' (on by default) status messages.
#'
#' @param x character vector of hosts/ips
#' @param port a single port or a vector of the same length as \code{x}; default is port \code{80}
#' @param timeout numner of seconds to give the host to respond to the connection request
#' @param quiet if \code{FALSE} then a message will be printed for each host contacted
#' @return logical vector; \code{TRUE} == host was reachable on the port within the timeout
#'         specified
#' @export
host_up <- function(x, port=80, timeout=2, quiet=FALSE) {
  purrr::map2_lgl(x, port, function(y, prt) {
    if (!quiet) message(sprintf("Trying: [%s:%s] (TCP)...", y, prt))
    sc <- purrr::safely(socketConnection)
    res <- sc(host=y, port=prt, blocking=TRUE, open="r", timeout=2)
    if (!is.null(res$result)) close(res$result)
    !is.null(res$result)
  })
}
