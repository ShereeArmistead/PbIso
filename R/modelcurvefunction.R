#' Create a dataframe with values to produce model curves
#'
#' This function creates a dataframe with four columns (time, 206Pb/204Pb, 207Pb/204Pb and 208Pb/204Pb ratios). These can be used for plotting model curves.
#' @param t sample age or time (Ma)
#' @param ... optional arguments
#' @param T1 model start time (Ma). Default is 3700
#' @param X1 206Pb/204Pb model starting composition. Default is 11.152
#' @param Y1 207Pb/204Pb model starting composition. Default is 12.998
#' @param Z1 208Pb/204Pb model starting composition. Default is 31.23
#' @param Mu1 238U/204Pb model. Default is 9.74
#' @param W1 232Th/204Pb model. Default is 36.84
#' @param U8U5 Present-day 238U/235U ratio. Default is 137.88
#' @param L5 235U decay constant. Default is 9.8485 * 10^-10
#' @param L8 238U decay constant. Default is 1.55125 * 10^-10
#' @param L2 232Th decay constant. Default is 0.49475 * 10^-10
#' @export
#' @usage
#' # Basic method accepting default model parameters for Stacey & Kramers (1975)
#' # 2nd stage model
#'   modelcurve(t, ...)
#'
#' # Advanced method using other values for optional parameters
#'   modelcurve(t, T1, X1, Y1, Z1, Mu1, W1, U8U5, L5, L8, L2)
#'
#' @examples
#' # Create a dataframe 'df' with the default Stacey & Kramers (1975) 2nd stage values
#' # for the time period 3700-0 Ma; which can then be used to plot a model curve
#'   df <- modelcurve(0:3700)
#'
#' # Create a dataframe 'df' with the Stacey & Kramers (1975) 1st stage model values
#' # over the time period 3700-0 Ma.
#'   df <- modelcurve(0:3700, T1 = 4570, X1 = 9.307, Mu1 = 7.19)
#'
#' # Create a dataframe 'df' for a model source Mu value of 8, over the time period
#' # 3700-0 Ma.
#'   df <- modelcurve(0:3700, Mu1 = 8)

modelcurve <- function(t, ..., T1 = 3700, X1 = 11.152, Y1 = 12.998, Z1 = 31.23, Mu1 = 9.74, W1 = 36.84, U8U5 = 137.88, L5 = 9.8485 * 10^-10, L8 = 1.55125 * 10^-10, L2 = 0.49475 * 10^-10, E1 = 0, E2 = 0, model) {
  if(!missing(model)) {
    T1  = ifelse(is.null(model$T1), T1, model$T1)
    X1  = ifelse(is.null(model$X1), X1, model$X1)
    Y1  = ifelse(is.null(model$Y1), Y1, model$Y1)
    Z1  = ifelse(is.null(model$Z1), Z1, model$Z1)
    Mu1 = ifelse(is.null(model$Mu1), Mu1, model$Mu1)
    W1  = ifelse(is.null(model$W1), W1, model$W1)
    E1  = ifelse(is.null(model$E1), E1, model$E1)
    E2  = ifelse(is.null(model$E2), E2, model$E2)
  }
  # x <- X1 + Mu1*(exp(L8*T1*10^6) - exp(L8*t*10^6))
  # y <- Y1 + (Mu1/U8U5)*(exp(L5*T1*10^6) - exp(L5*t*10^6))
  # z <- Z1 + W1*(exp(L2*T1*10^6) - exp(L2*t*10^6))

  x <- X1 + Mu1*((exp(L8*T1*10^6)*(1 - E1*(T1*10^6 - (1/L8)))) - (exp(L8*t*10^6)*(1 - E1*(t*10^6 - (1/L8)))))
  y <- Y1 + (Mu1/U8U5)*((exp(L5*T1*10^6)*(1 - E1*(T1*10^6 - (1/L5)))) - (exp(L5*t*10^6)*(1-E1*(t*10^6 - 1/L5))))
  z <- Z1 + W1*((exp(L2*T1*10^6)*(1-E2*(T1*10^6-(1/L2)))) - (exp(L2*t*10^6)*(1-E2*(t*10^6-1/L2))))

  return(data.frame(t, x, y, z))
}
