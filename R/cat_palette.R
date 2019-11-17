#' Generate palette for cat colors
#'
#'
#' @param name Name of color (cat) palette
#' @param n Number of colors desired If omitted, uses all colours.
#' @param type Either "discrete" or "continuous",
#'
#' @export
#' @examples
#' cat_palette(name="Pumpkin")
#' cat_palette(name="Chestnut", type="continuous")
#' cat_palette(name="SnowLion", n=100)
#'


cat_palette <- function(name, n, type = c("discrete", "continuous")) {
  pal <- cat_colors[[name]]
  if (is.null(pal)) {
    stop("Palette not found.")
  }
  if (missing(n)) {
    n <- length(pal[1,])
  }
  if (missing(type)) {
    if (n > length(pal[1,])) {
      type <- "continuous"
    }
    else {
      type <- "discrete"
    }
  }
  type <- match.arg(type, choices = c("continuous", "discrete"))


  if (type == "discrete" && n > length(pal[1,])) {
    stop("Number of requested colors greater than what palette can offer")
  }


  out <- switch(type,
    continuous = grDevices::colorRampPalette(pal[1,])(n),
    discrete = pal[1,][as.numeric(pal[2,])]
  )
  structure(out, class = "palette", name = name)
}
