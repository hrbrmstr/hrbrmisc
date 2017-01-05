#' Completely flush-left-align ggplot2 title
#'
#' @return \code{gtable} object
#' @param gg ggplot2 object
#' @export
title_left <- function(gg) {

  gt <- ggplot_gtable(ggplot_build(gg))
  gt$layout[which(gt$layout$name == "title"), c("l", "r")] <- c(1, max(gt$layout$r))
  gt

}
