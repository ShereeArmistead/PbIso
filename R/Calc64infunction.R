#' Calculate the initial 206Pb/204Pb ratio
#'
#' This function calculates the initial 206Pb/204Pb for a sample with a known age (t),
#' measured 206Pb/204Pb (x) and measured 207Pb/204Pb (y) ratios
#'
#' @param t sample age or time (Ma)
#' @param x sample 206Pb/204Pb ratio
#' @param y sample 207Pb/204Pb ratio
#' @param ... optional arguments
#' @param T1 model start time (Ma). Default is 3700
#' @param X1 206Pb/204Pb model starting composition. Default is 11.152
#' @param Y1 207Pb/204Pb model starting composition. Default is 12.998
#' @param U8U5 Present-day 238U/235U ratio. Default is 137.88
#' @param L5 235U decay constant. Default is 9.8485 * 10^-10
#' @param L8 238U decay constant. Default is 1.55125 * 10^-10
#' @export
#' @usage
#' # Basic usage accepting default model parameters for Stacey & Kramers (1975) 2nd stage model
#'   Calc64in(t, x, y, ...)
#'
#' # Advanced usage with optional arguments
#'   Calc64in(t, x, y, T1, X1, Y1, U8U5, L5, L8)
#'
#' @examples
#' # Example of basic method using a hypothetical sample age of 2700 Ma, measured
#' # 206Pb/204Pb = 13.5 and 207Pb/204Pb = 14.5
#'   Calc64in(2700, 13.5, 14.5)
#'
#' # Example of using additional optional arguments based on Stacey & Kramers (1975) 1st stage model
#'   Calc64in(2700, 13.5, 14.5, T1 = 4570, X1 = 9.307, Y1 = 10.294)
#'
Calc64in <- function(t, x, y, ..., T1 = 3700, X1 = 11.152, Y1 = 12.998, U8U5 = 137.88, L5 = 9.8485 * 10^-10, L8 = 1.55125 * 10^-10) {
  X1 + (((exp(L5*t*10^6) - 1) / (U8U5 * (exp(L8*t*10^6) - 1)) * (X1 - x) + y - Y1) /
          ((exp(L5*T1*10^6) - exp(L5*t*10^6)) / U8U5 - (exp(L5*t*10^6) - 1) /
             (U8U5 * (exp(L8*t*10^6) - 1)) * (exp(L8*T1*10^6) - exp(L8*t*10^6))))*(exp(L8*T1*10^6) - exp(L8*t*10^6))
}
