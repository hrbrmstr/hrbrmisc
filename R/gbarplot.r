#' Quick way to replace the handy \code{barplot}
#' @export
gbarplot <- function(x, fill="maroon", col="black") {
  UseMethod("tidy_html")
}

#' @export
#' @rdname gbarplot
gbarplot.table <- function(x, fill="maroon", col="black") {
  df <- broom::tidy(x)
  gbarplot(df)
}

#' @export
#' @rdname gbarplot
gbarplot.vector <- function(x, fill="maroon", col="black") {
  gbarplot(as.list(x))
}

#' @export
#' @rdname gbarplot
gbarplot.list <- function(x, fill="maroon", col="black") {
  flatten_df(x) %>%
    gather(Var, Freq) -> df
  gbarplot(df)
}

#' @export
#' @rdname gbarplot
gbarplot.data.frame <- function(x, fill="maroon", col="black") {
  ggplot(x, aes(Var, Freq)) +
    geom_bar(stat="identity", width=0.65, fill=fill, col=col)
}

