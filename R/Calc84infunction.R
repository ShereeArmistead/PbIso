#' Calculate the initial 208Pb/204Pb ratio
#'
#' This function calculates the initial 208Pb/204Pb for a sample with a known age (t),
#' measured 206Pb/204Pb (x), measured 207Pb/204Pb (y) and measured 208Pb/204Pb ratios.
#'
#' @param t sample age or time (Ma)
#' @param x sample 206Pb/204Pb ratio
#' @param y sample 207Pb/204Pb ratio
#' @param z sample 208Pb/204Pb ratio
#' @param ... optional arguments
#' @param T1 model start time (Ma). Default is 3700
#' @param X1 206Pb/204Pb model starting composition. Default is 11.152
#' @param Y1 207Pb/204Pb model starting composition. Default is 12.998
#' @param Z1 208Pb/204Pb model starting composition. Default is 31.23
#' @param U8U5 Present-day 238U/235U ratio. Default is 137.88
#' @param L5 235U decay constant. Default is 9.8485 * 10^-10
#' @param L8 238U decay constant. Default is 1.55125 * 10^-10
#' @param L2 232Th decay constant. Default is 0.49475 * 10^-10
#' @export
#' @usage
#' # Basic usage accepting default model parameters for Stacey & Kramers (1975) 2nd stage model
#'   Calc84in(t, x, y, z, ...)
#'
#' # Advanced usage with optional arguments
#'   Calc84in(t, x, y, z, T1, X1, Y1, Z1, U8U5, L5, L8, L2)
#'
#' @examples
#' # Example of basic method using a hypothetical sample age of 2700 Ma, measured
#' # 206Pb/204Pb = 13.5, measured 207Pb/204Pb = 14.5 and measured 208Pb/204Pb = 33
#'   Calc84in(2700, 13.5, 14.5, 33)
#'
#' # Example of using additional optional arguments based on Stacey & Kramers (1975) 1st stage model
#'   Calc84in(2700, 13.5, 14.5, 33, T1 = 4570, X1 = 9.307, Y1 = 10.294, Z1 = 31.23)
#'
Calc84in <- function(t, x, y, z, ..., T1 = 3700, X1 = 11.152, Y1 = 12.998, Z1 = 31.23, U8U5 = 137.88, L2 = 0.49475 * 10^-10, L5 = 9.8485 * 10^-10, L8 = 1.55125 * 10^-10, model) {
  if(!missing(model)) {
    T1  = ifelse(is.null(model$T1), T1, model$T1)
    X1  = ifelse(is.null(model$X1), X1, model$X1)
    Y1  = ifelse(is.null(model$Y1), Y1, model$Y1)
    Z1  = ifelse(is.null(model$Z1), Z1, model$Z1)
  }
  Z1 + ((((exp(L5*t*10^6) - 1) / (U8U5 * (exp(L8*t*10^6) - 1)) * (X1 - x) + y - Y1) /
           ((exp(L5*T1*10^6) - exp(L5*t*10^6)) / U8U5 - (exp(L5*t*10^6) - 1) /
              (U8U5 * (exp(L8*t*10^6) - 1)) * (exp(L8*T1*10^6) - exp(L8*t*10^6))))*(((z - Z1) / (x - X1)) / (((exp(L2*T1*10^6) - exp(L2*t*10^6))) / (exp(L8*T1*10^6) - exp(L8*t*10^6)))))*(exp(L2*T1*10^6) - exp(L2*t*10^6))
}
