#' Add a subtitle to a ggplot object and draw plot on current graphics device.
#'
#' @param gg ggplot2 object
#' @param label subtitle label
#' @param fontfamily font family to use. The function doesn't pull any font
#'        information from \code{gg} so you should consider specifying fonts
#'        for the plot itself and here. Or send me code to make this smarter :-)
#' @param fontsize font size
#' @param hjust,vjust horizontal/vertical justification
#' @param bottom_margin space between bottom of subtitle and plot (code{pts})
#' @param newpage draw new (empty) page first?
#' @param vp viewport to draw plot in
#' @param ... parameters passed to \code{gpar} in call to \code{textGrob}
#' @return Invisibly returns the result of \code{\link{ggplot_build}}, which
#'   is a list with components that contain the plot itself, the data,
#'   information about the scales, panels etc.
#' @export
ggplot_with_subtitle <- function(gg,
                                 label="",
                                 fontfamily="OpenSans-CondensedLight",
                                 fontsize=10,
                                 hjust=0, vjust=0,
                                 bottom_margin=5.5,
                                 newpage=is.null(vp),
                                 vp=NULL,
                                 ...) {

  if (is.null(fontfamily)) {
    gpr <- gpar(fontsize=10, ...)
  } else {
    gpr <- gpar(fontfamily=fontfamily, fontsize=10, ...)
  }

  subtitle <- textGrob(label, x=unit(hjust, "npc"), y=unit(hjust, "npc"),
                       hjust=hjust, vjust=vjust,
                       gp=gpr)

  data <- ggplot_build(gg)

  gt <- ggplot_gtable(data)
  gt <- gtable_add_rows(gt, grobHeight(subtitle), 2)
  gt <- gtable_add_grob(gt, subtitle, 3, 4, 3, 4, 8, "off", "subtitle")
  gt <- gtable_add_rows(gt, grid::unit(bottom_margin, "pt"), 3)

  if (newpage) grid.newpage()

  if (is.null(vp)) {
    grid.draw(gt)
  } else {
    if (is.character(vp)) seekViewport(vp) else pushViewport(vp)
    grid.draw(gt)
    upViewport()
  }

  invisible(data)

}

#' My ggplot2 go-to theme
#'
#' It requires installing Open Sans Condensed fonts from Google Fonts
#' unless you change the font parameters
#'
#' @param base_family base font family
#' @param base_size base font size
#' @param strip_text_family facet label font family
#' @param strip_text_size facet label text size
#' @param plot_title_family plot tilte family
#' @param plot_title_size plot title font size
#' @param plot_title_margin plot title margin
#' @param axis_title_family axis title font family
#' @param axis_title_size axis title font size
#' @param axis_title_just axis title font justification \code{blmcrt}
#' @param grid panel grid (\code{TRUE}, \code{FALSE}, or a combination of
#'        \code{X}, \code{x}, \code{Y}, \code{y})
#' @param axis axis
#' @param ticks ticks
#' @export
theme_hrbrmstr <- function(base_family = "OpenSans-CondensedLight",
                           base_size = 11,
                           strip_text_family = base_family,
                           strip_text_size = 12,
                           plot_title_family = "OpenSans-CondensedBold",
                           plot_title_size = 18,
                           plot_title_margin = 16,
                           axis_title_family = "OpenSans-CondensedLightItalic",
                           axis_title_size = 9,
                           axis_title_just = "rt",
                           grid = TRUE,
                           axis = FALSE,
                           ticks = FALSE) {

  ret <- theme_minimal(base_family=base_family, base_size=base_size)

  ret <- ret + theme(legend.background=element_blank())
  ret <- ret + theme(legend.key=element_blank())

  if (inherits(grid, "character") | grid == TRUE) {

    ret <- ret + theme(panel.grid=element_line(color="#2b2b2bdd", size=0.10))
    ret <- ret + theme(panel.grid.major=element_line(color="#2b2b2b99", size=0.10))
    ret <- ret + theme(panel.grid.minor=element_line(color="#2b2b2b99", size=0.05))

    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) ret <- ret + theme(panel.grid.major.x=element_blank())
      if (regexpr("Y", grid)[1] < 0) ret <- ret + theme(panel.grid.major.y=element_blank())
      if (regexpr("x", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.x=element_blank())
      if (regexpr("y", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.y=element_blank())
    }

  } else {
    ret <- ret + theme(panel.grid=element_blank())
  }

  if (inherits(axis, "character") | axis == TRUE) {
    ret <- ret + theme(axis.line=element_line(color="#2b2b2b", size=0.15))
    if (inherits(axis, "character")) {
      if (regexpr("X", axis)[1] < 0) ret <- ret + theme(axis.line.x=element_blank())
      if (regexpr("Y", axis)[1] < 0) ret <- ret + theme(axis.line.y=element_blank())
    }
  } else {
    ret <- ret + theme(axis.line=element_blank())
  }

  if (!ticks) ret <- ret + theme(axis.ticks = element_blank())

  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)

  ret <- ret + theme(axis.title.x=element_text(hjust=xj, size=axis_title_size, family=axis_title_family))
  ret <- ret + theme(axis.title.y=element_text(hjust=yj, size=axis_title_size, family=axis_title_family))
  ret <- ret + theme(strip.text=element_text(hjust=0, size=strip_text_size, family=strip_text_family))
  ret <- ret + theme(plot.title=element_text(hjust=0, size=plot_title_size, margin=margin(b=plot_title_margin), family=plot_title_family))

  ret

}
