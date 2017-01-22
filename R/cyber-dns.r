#' Get public DNS servers list
#'
#' @export
get_public_dns_servers <- function() {
  suppressMessages(readr::read_csv("http://public-dns.info/nameservers.csv"))
}

#' Get \code{.gov} domains
#'
#' Retrieves full list from \code{https://github.com/GSA/data/tree/gh-pages/dotgov-domains}
#'
#' @export
get_dotgov <- function() {
  dg <- suppressMessages(readr::read_csv("https://raw.githubusercontent.com/GSA/data/gh-pages/dotgov-domains/current-full.csv"))
  colnames(dg) <- gsub(" ", "_", tolower(colnames(dg)))
  dg$domain_name <- tolower(dg$domain_name)
  dg
}
