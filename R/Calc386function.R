#' Calculate the U238/Pb206 ratio
#'
#' This function calculates the U238/Pb206 ratio for a given time, either by using
#' Stacey & Kramers (1975) 2nd stage model parameters as default, or by setting
#' optional arguments.
#'
#' @param t sample age or time (Ma)
#' @param ... optional arguments
#' @param L8 238U decay constant. Default is 1.55125 * 10^-10
#' @export
#'

Calc386 <- function(t, ..., L8 = 1.55125 * 10^-10) {
  1 / (exp(L8*t*10^6)-1)
}
