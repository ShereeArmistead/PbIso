#' Calculate the slope for a given sample age (t)
#'
#' This function calculates the slope of a line from which samples from the same reservoir, at the same time, will fall along
#'
#' @param t sample age or time (Ma)
#' @param ... optional arguments
#' @param U8U5 Present-day 238U/235U ratio. Default is 137.88
#' @param L5 235U decay constant. Default is 9.8485 * 10^-10
#' @param L8 238U decay constant. Default is 1.55125 * 10^-10
#' @export
#'
#' @examples
#' # Example of basic method using a hypothetical sample age of 2700 Ma
#'   mslope(2700)
mslope <- function(t, ..., U8U5 = 137.88, L5 = 9.8485 * 10^-10, L8 = 1.55125 * 10^-10) {
  (exp(L5*t*10^6) - 1) / (U8U5 * (exp(L8*t*10^6) - 1))
}

