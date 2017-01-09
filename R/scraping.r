#' Setup connection to my local phantomjs webdriver
#'
#' For scraping efforts it's handy to have a webdriver always going. I happen
#' to have a spare system (my local mini-CRAN mirror) where I can keep a live
#' phantomjs node active.
#'
#' Relies on two environment variables being set since you could theoretically
#' target the node and exploit webkit vulns if I hardcoded the server info.
#'
#' @param host host of the phantomjs webdriver instance
#' @param port port of the phantomjs webdriver instance
#' @export
spectre <- function(host=Sys.getenv("PHANTOM_WEBDRIVER_HOST"),
                    port=Sys.getenv("PHANTOM_WEBDRIVER_PORT"),
                    extra=list(phantomjs.page.settings.userAgent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.51 Safari/537.36")) {

  require(seleniumPipes)

  seleniumPipes::remoteDr(sprintf("http://%s", host),
                          browserName="phantomjs",
                          port=as.integer(port),
                          extraCapabilities=extra)

}
