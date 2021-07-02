#' Calculate the time-integrated kappa
#'
#' This function calculates the time-integrated kappa
#'
#' @param t sample age or time (Ma)
#' @param x sample 206Pb/204Pb ratio
#' @param z sample 208Pb/204Pb ratio
#' @param ... optional arguments
#' @param T1 model start time (Ma). Default is 3700
#' @param X1 206Pb/204Pb model starting composition. Default is 11.152
#' @param Z1 208Pb/204Pb model starting composition. Default is 31.23
#' @param L8 238U decay constant. Default is 1.55125 * 10^-10
#' @param L2 232Th decay constant. Default is 0.49475 * 10^-10
#' @export
#' @usage
#' # Basic usage accepting default model parameters for Stacey & Kramers (1975) 2nd stage model
#'   CalcKa(t, z, x, ...)
#'
#' # Advanced usage with optional arguments
#'   CalcKa(t, z, x, T1, X1, Z1, L2, L8)
#'
#' @examples
#' # Example of basic method using a hypothetical sample age of 2700 Ma, measured
#' # 208Pb/204Pb = 33 and measured 206Pb/204Pb = 13.5
#'   CalcKa(2700, 33, 13.5)
#'
#' # Example of using optional arguments based on Stacey & Kramers (1975) 1st stage model
#'   CalcKa(2700, 33, 13.5, T1 = 4570, X1 = 9.307, Z1 = 31.23)
#'
CalcKa <- function(t, z, x, ..., T1 = 3700, X1 = 11.152, Z1 = 31.23, L2 = 0.49475 * 10^-10, L8 = 1.55125 * 10^-10, model) {
  if(!missing(model)) {
    T1  = ifelse(is.null(model$T1), T1, model$T1)
    X1  = ifelse(is.null(model$X1), X1, model$X1)
    Z1  = ifelse(is.null(model$Z1), Z1, model$Z1)
  }
  ((z - Z1) / (x - X1)) / (((exp(L2*T1*10^6) - exp(L2*t*10^6))) / (exp(L8*T1*10^6) - exp(L8*t*10^6)))
}
