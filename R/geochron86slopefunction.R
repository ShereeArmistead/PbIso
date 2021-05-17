#' Slope of a geochron line on a 206Pb/204Pb vs 208Pb/204Pb plot for time (t)
#'
#' This function calculates the geochron slope on a 206Pb/204Pb vs 208Pb/204Pb plot for a given time (t)
#'
#' @param t sample age or time (Ma)
#' @param ... optional arguments
#' @param T1 model start time (Ma). Default is 3700
#' @param X1 206Pb/204Pb model starting composition. Default is 11.152
#' @param Z1 208Pb/204Pb model starting composition. Default is 31.23
#' @param Mu1 238U/204Pb model. Default is 9.74
#' @param W1 232Th/204Pb model. Default is 36.84
#' @param L8 238U decay constant. Default is 1.55125 * 10^-10
#' @param L2 232Th decay constant. Default is 0.49475 * 10^-10
#' @export
#' @usage
#' # Calculate the geochron on a 206Pb/204Pb vs 207Pb/204Pb plot for time = 2700 Ma
#'   geochron86slope(2700)
#' @examples
#' # Calculate the geochron on a 206Pb/204Pb vs 207Pb/204Pb plot for time = 2700 Ma
#'   geochron86slope(2700)

geochron86slope <- function(t, ..., T1 = 3700, X1 = 11.152, Z1 = 31.23, Mu1 = 9.74, W1 = 36.84, L8 = 1.55125 * 10^-10, L2 = 0.49475 * 10^-10) {
  ((Z1 + W1*(exp(L2*T1*10^6) - exp(L2*t*10^6))) - Z1) / ((X1 + Mu1*(exp(L8*T1*10^6) - exp(L8*t*10^6))) - X1)
}
