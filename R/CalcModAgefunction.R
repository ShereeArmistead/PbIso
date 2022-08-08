#' Calculates the model age
#'
#' This function calculates the model age for given 206Pb/204Pb and 207Pb/204Pb ratios
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
#'   CalcModAge(x, y, ...)
#'
#' # Advanced usage with optional arguments
#'   CalcModAge(x, y, T1, X1, Y1, U8U5, L5, L8)
#'
#' @examples
#' # Example of basic method using a hypothetical sample with measured 206Pb/204Pb = 13.5
#' # and 207Pb/204Pb = 14.5
#'   CalcModAge(13.5, 14.5)
#'
#' # Example of using optional arguments based on Stacey & Kramers (1975) 1st stage model
#'   CalcModAge(13.5, 14.5, T1 = 4570, X1 = 9.307, Y1 = 10.294)
#'

CalcModAge <- function(x, y, ..., T1 = 3700, X1 = 11.152, Y1 = 12.998, U8U5 = 137.88, L5 = 9.8485 * 10^-10, L8 = 1.55125 * 10^-10, model) if (!is.na(x) & !is.na(y)) {
  if(!missing(model)) {
    T1  = ifelse(is.null(model$T1), T1, model$T1)
    X1  = ifelse(is.null(model$X1), X1, model$X1)
    Y1  = ifelse(is.null(model$Y1), Y1, model$Y1)
  }

  agefun <- function(t, x, y, T1 = 3700, X1 = 11.152, Y1 = 12.998, U8U5 = 137.88, L5 = 9.8485 * 10^-10, L8 = 1.55125 * 10^-10) {
    ((1 / U8U5) * ((exp(L5*T1*10^6) - exp(L5*t*10^6)) /
                     (exp(L8*T1*10^6) - exp(L8*t*10^6)))) - ((y - Y1) / (x - X1))
  }

  tryCatch(uniroot(agefun,
                   x = x, y = y, T1 = T1, X1 = X1, Y1 = Y1, U8U5 = U8U5, L5 = L5, L8 = L8, c(-4700,4700), extendInt = "yes")$root,
           error = function(e) {
             return(as.numeric(NA))
           }
  )
} else{NA}
