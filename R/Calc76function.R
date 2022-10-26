#' Calculate the 207Pb/206Pb ratio
#'
#' This function calculates the 207Pb/206Pb ratio for a given time, either by using
#' Stacey & Kramers (1975) 2nd stage model parameters as default, or by setting
#' optional arguments.
#'
#' @param t sample age or time (Ma)
#' @param ... optional arguments
#' @param U8U5 Present-day 238U/235U ratio. Default is 137.88
#' @param L5 235U decay constant. Default is 9.8485 * 10^-10
#' @param L8 238U decay constant. Default is 1.55125 * 10^-10
#' @export
#'

Calc76 <- function(t, ..., U8U5 = 137.88, L5 = 9.8485 * 10^-10, L8 = 1.55125 * 10^-10) {
  (1/U8U5) * ((exp(L5*t*10^6)-1)/(exp(L8*t*10^6)-1))
}
