#' Calculate the least radiogenic values
#'
#' This function filters a dataset for the least radiogenic analysis
#'
#' @param df original dataframe from which the data is to be filtered
#' @param group group e.g. deposit, region
#' @param value e.g. 206Pb/204Pb
#' @export
#' @usage
#'
#'   LeastRad(df, group, value)
#'
#'
#' @examples
#' # Example
#'   dfLR <- LeastRad(df, DepositName, Pb74)
#'

LeastRad <- function(df, group, value) {
  df %>%
  dplyr::group_by(!!enquo(group)) %>%
  dplyr::slice(which.min(!!enquo(value)))
}


  #Pb.datLR <- Pb.dat %>%
  #  group_by(DepositName) %>%
  #  slice(which.min(Pb74))




