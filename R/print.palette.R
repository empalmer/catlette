#' Function to print color palettes
#' @param n: Number of colors desired, uses all colours by default
#' @param name: Name of color palette.
#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n),
    col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n"
  )

  text(median(1:n), 1, labels = attr(x, "name"), cex = 3, family = "sans")
}
