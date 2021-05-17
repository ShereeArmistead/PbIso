#' Calculate the 208Pb/204Pb ratio
#'
#' This function calculates the 208Pb/204Pb ratio for a given time, either by using
#' Stacey & Kramers (1975) 2nd stage model parameters as default, or by setting
#' optional arguments.
#'
#' @param t sample age or time (Ma)
#' @param ... optional arguments
#' @param T1 model start time (Ma). Default is 3700
#' @param Z1 208Pb/204Pb model starting composition. Default is 31.23
#' @param W1 232Th/204Pb model. Default is 36.84
#' @param L2 232Th decay constant. Default is 0.49475 * 10^-10
#' @export
#' @usage
#'
#' # Basic usage accepting default model parameters for Stacey & Kramers (1975) 2nd stage model
#'   Calc84(t, ...)
#'
#' # Advanced usage with optional arguments
#'   Calc84(t, T1, Z1, W1, L2)
#'
#' @examples
#' # Example of basic method using a hypothetical sample age of 2700 Ma
#'   Calc84(2700)
#'
#' # Example of using optional arguments based on Stacey & Kramers (1975) 1st stage model
#'   Calc84(2700, T1 = 4570, Z1 = 29.487, W1 = 32.21)
#'
#' # Example of using the optional argument for W1 = 30 only, and accepting the other defaults
#'   Calc84(2700, W1 = 30)

Calc84 <- function(t, ..., T1 = 3700, Z1 = 31.23, W1 = 36.84, L2 = 0.49475 * 10^-10) {
  Z1 + W1*(exp(L2*T1*10^6) - exp(L2*t*10^6))
}
