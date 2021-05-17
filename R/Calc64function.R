#' Calculate the 206Pb/204Pb ratio
#'
#' This function calculates the 206Pb/204Pb ratio for a given time, either by using
#' Stacey & Kramers (1975) 2nd stage model parameters as default, or by setting
#' optional arguments.
#'
#' @param t sample age or time (Ma)
#' @param ... optional arguments
#' @param T1 model start time (Ma). Default is 3700
#' @param X1 206Pb/204Pb model starting composition. Default is 11.152
#' @param Mu1 238U/204Pb model. Default is 9.74
#' @param L8 238U decay constant. Default is 1.55125 * 10^-10
#' @export
#' @usage
#' # Basic usage accepting default model parameters for Stacey & Kramers (1975) 2nd stage model.
#'   Calc64(t, ...)
#'
#' # Advanced usage with optional arguments
#'   Calc64(t, T1, X1, Mu1, L8)
#'
#' @examples
#' # Example of basic method using a hypothetical sample age of 2700 Ma
#'   Calc64(2700)
#'
#' # Example of using optional arguments based on Stacey & Kramers (1975) 1st stage model
#'   Calc64(2700, T1 = 4570, X1 = 9.307, Mu1 = 7.19)
#'
#' # Example of using the optional argument for Mu1 = 8 only, and accepting the other defaults
#'   Calc64(2700, Mu1 = 8)

Calc64 <- function(t, ..., T1 = 3700, X1 = 11.152, Mu1 = 9.74, L8 = 1.55125 * 10^-10) {
  X1 + Mu1*(exp(L8*T1*10^6) - exp(L8*t*10^6))
}
