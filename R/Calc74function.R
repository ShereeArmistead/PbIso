#' Calculate the 207Pb/204Pb ratio
#'
#' This function calculates the 207Pb/204Pb ratio for a given time, either by using
#' Stacey & Kramers (1975) 2nd stage model parameters as default, or by setting
#' optional arguments.
#'
#' @param t sample age or time (Ma)
#' @param ... optional arguments
#' @param T1 model start time (Ma). Default is 3700
#' @param Y1 207Pb/204Pb model starting composition. Default is 12.998
#' @param Mu1 238U/204Pb model. Default is 9.74
#' @param U8U5 Present-day 238U/235U ratio. Default is 137.88
#' @param L5 235U decay constant. Default is 9.8485 * 10^-10
#' @export
#' @usage
#'
#' # Basic usage accepting default model parameters for Stacey & Kramers (1975) 2nd stage model
#'   Calc74(t, ...)
#'
#' # Advanced usage with optional arguments
#'   Calc74(t, T1, Y1, Mu1, L5)
#'
#' @examples
#' # Example of basic method using a hypothetical sample age of 2700 Ma
#'   Calc74(2700)
#'
#' # Example of using optional arguments based on Stacey & Kramers (1975) 1st stage model
#'   Calc74(2700, T1 = 4570, Y1 = 10.294, Mu1 = 7.19)
#'
#' # Example of using the optional argument for Mu1 = 8 only, and accepting the other defaults
#'   Calc74(2700, Mu1 = 8)

Calc74 <- function(t, ..., T1 = 3700, Y1 = 12.998, Mu1 = 9.74, U8U5 = 137.88, L5 = 9.8485 * 10^-10) {
  Y1 + ((Mu1/U8U5)*(exp(L5*T1*10^6) - exp(L5*t*10^6)))
}
