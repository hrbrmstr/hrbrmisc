#' Get public DNS servers list
#'
#' @export
get_public_dns_servers <- function() {
  suppressMessages(readr::read_csv("http://public-dns.info/nameservers.csv"))
}
