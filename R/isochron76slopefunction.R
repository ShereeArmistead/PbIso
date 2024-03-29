#' Slope of an isochron line on a 206Pb/204Pb vs 207Pb/204Pb plot for time (t)
#'
#' This function calculates the isochron slope on a 206Pb/204Pb vs 207Pb/204Pb plot for a given time (t)
#'
#' @param t sample age or time (Ma)
#' @param ... optional arguments
#' @param T1 model start time (Ma). Default is 3700
#' @param X1 206Pb/204Pb model starting composition. Default is 11.152
#' @param Y1 207Pb/204Pb model starting composition. Default is 12.998
#' @param Mu1 238U/204Pb model. Default is 9.74
#' @param U8U5 Present-day 238U/235U ratio. Default is 137.88
#' @param L5 235U decay constant. Default is 9.8485 * 10^-10
#' @param L8 238U decay constant. Default is 1.55125 * 10^-10
#' @export
#' @usage
#' # Calculate the isochron on a 206Pb/204Pb vs 207Pb/204Pb plot for time = 2700 Ma
#'   isochron76slope(2700)
#' @examples
#' # Calculate the isochron on a 206Pb/204Pb vs 207Pb/204Pb plot for time = 2700 Ma
#'   isochron76slope(2700)

isochron76slope <- function(t, ..., T1 = 3700, X1 = 11.152, Y1 = 12.998, Mu1 = 9.74, U8U5 = 137.88, L5 = 9.8485 * 10^-10, L8 = 1.55125 * 10^-10, model) {
  if(!missing(model)) {
    T1  = ifelse(is.null(model$T1), T1, model$T1)
    X1  = ifelse(is.null(model$X1), X1, model$X1)
    Y1  = ifelse(is.null(model$Y1), Y1, model$Y1)
    Mu1 = ifelse(is.null(model$Mu1), Mu1, model$Mu1)
  }
  ((Y1 + (Mu1/U8U5)*(exp(L5*T1*10^6) - exp(L5*t*10^6))) - Y1) / ((X1 + Mu1*(exp(L8*T1*10^6) - exp(L8*t*10^6))) - X1)
}
