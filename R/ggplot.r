#' My ggplot2 go-to theme
#'
#' It requires installing Noyh Slim fonts (not free) unless you change
#' the font parameters
#'
#' @param base_family base font family
#' @param base_size base font size
#' @param strip_text_family facet label font family
#' @param strip_text_size facet label text size
#' @param plot_title_family plot tilte family
#' @param plot_title_size plot title font size
#' @param plot_title_margin plot title margin
#' @param subtitle_family plot subtitle family
#' @param subtitle_size plot subtitle size
#' @param subtitle_margin plot subtitle margin
#' @param caption_family plot caption family
#' @param caption_size plot caption size
#' @param caption_margin plot caption margin
#' @param axis_title_family axis title font family
#' @param axis_title_size axis title font size
#' @param axis_title_just axis title font justification \code{blmcrt}
#' @param grid panel grid (\code{TRUE}, \code{FALSE}, or a combination of
#'        \code{X}, \code{x}, \code{Y}, \code{y})
#' @param axis axis \code{TRUE}, \code{FALSE}, [\code{xy}]
#' @param ticks ticks
#' @export
theme_hrbrmstr <- function(base_family = "NoyhSlim-Light",
                           base_size = 11,
                           strip_text_family = base_family,
                           strip_text_size = 12,
                           plot_title_family = "NoyhSlim-Bold",
                           plot_title_size = 18,
                           plot_title_margin = 10,
                           subtitle_family = "NoyhSlim-LightItalic",
                           subtitle_size = 14,
                           subtitle_margin = 15,
                           caption_family = "NoyhSlim-ExtraLight",
                           caption_size = 9,
                           caption_margin = 10,
                           axis_title_family = subtitle_family,
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
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + theme(axis.line.x=element_blank())
      } else {
        ret <- ret + theme(axis.line.x=element_line(color="#2b2b2b", size=0.15))
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + theme(axis.line.y=element_blank())
      } else {
        ret <- ret + theme(axis.line.y=element_line(color="#2b2b2b", size=0.15))
      }
    } else {
      ret <- ret + theme(axis.line.x=element_line(color="#2b2b2b", size=0.15))
      ret <- ret + theme(axis.line.y=element_line(color="#2b2b2b", size=0.15))
    }
  } else {
    ret <- ret + theme(axis.line=element_blank())
  }

  if (!ticks) {
    ret <- ret + theme(axis.ticks = element_blank())
    ret <- ret + theme(axis.ticks.x = element_blank())
    ret <- ret + theme(axis.ticks.y = element_blank())
  } else {
    ret <- ret + theme(axis.ticks = element_line(size=0.15))
    ret <- ret + theme(axis.ticks.x = element_line(size=0.15))
    ret <- ret + theme(axis.ticks.y = element_line(size=0.15))
    ret <- ret + theme(axis.ticks.length = grid::unit(5, "pt"))
  }

  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)

  ret <- ret + theme(axis.text.x=element_text(margin=margin(t=-10)))
  ret <- ret + theme(axis.text.y=element_text(margin=margin(r=-10)))
  ret <- ret + theme(axis.title=element_text(size=axis_title_size, family=axis_title_family))
  ret <- ret + theme(axis.title.x=element_text(hjust=xj, size=axis_title_size, family=axis_title_family))
  ret <- ret + theme(axis.title.y=element_text(hjust=yj, size=axis_title_size, family=axis_title_family))
  ret <- ret + theme(strip.text=element_text(hjust=0, size=strip_text_size, family=strip_text_family))
  ret <- ret + theme(plot.title=element_text(hjust=0, size=plot_title_size, margin=margin(b=plot_title_margin), family=plot_title_family))
  ret <- ret + theme(plot.subtitle=element_text(hjust=0, size=subtitle_size, margin=margin(b=subtitle_margin), family=subtitle_family))
  ret <- ret + theme(plot.caption=element_text(hjust=1, size=caption_size, margin=margin(t=caption_margin), family=caption_family))

  ret

}

#' Open Sans Condensed theme
#'
#' @export
theme_hrbrmstr_os <- function() {
  theme_hrbrmstr(base_family="OpenSans-CondensedLight",
                 plot_title_family="OpenSans-CondensedBold",
                 subtitle_family="OpenSans-CondensedLightItalic",
                 caption_family="OpenSans-CondensedLight")
}

#' Arial Narrow theme
#'
#' @export
theme_hrbrmstr_ar <- function() {
  theme_hrbrmstr(base_family="ArialNarrow",
                 plot_title_family="ArialNarrow-Bold",
                 subtitle_family="ArialNarrow-Italic",
                 caption_family="ArialNarrow")
}

#' Myriad Pro theme
#'
#' @export
theme_hrbrmstr_my <- function() {
  theme_hrbrmstr(base_family="MyriadPro-Cond",
                 plot_title_family="MyriadPro-BoldCond",
                 subtitle_family="MyriadPro-CondIt",
                 caption_family="MyriadPro-Cond")
}

#' San Francisco theme
#'
#' @export
theme_hrbrmstr_sf <- function() {
  theme_hrbrmstr(base_family="SanFranciscoText-Light",
                 plot_title_family="SanFranciscoText-Bold",
                 subtitle_family="SanFranciscoText-LightItalic",
                 caption_family="SanFranciscoText-Light")
}

#' Skia theme
#'
#' @export
theme_hrbrmstr_sk <- function() {
  theme_hrbrmstr(base_family="Skia-Regular_Condensed",
                 plot_title_family="Skia-Regular_Black",
                 subtitle_family="Skia-Regular_Light",
                 caption_family="Skia-Regular_Light-Condensed")
}


#' Exo 2 theme
#'
#' @export
theme_hrbrmstr_ex <- function() {
  theme_hrbrmstr(base_family="Exo2-Light",
                 plot_title_family="Exo2-Bold",
                 subtitle_family="Exo2-LightItalic",
                 caption_family="Exo2-Thin")
}
