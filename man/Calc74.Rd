% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Calc74function.R
\name{Calc74}
\alias{Calc74}
\title{Calculate the 207Pb/204Pb ratio}
\usage{
# Basic usage accepting default model parameters for Stacey & Kramers (1975) 2nd stage model
  Calc74(t, ...)

# Advanced usage with optional arguments
  Calc74(t, T1, Y1, Mu1, L5)
}
\arguments{
\item{t}{sample age or time (Ma)}

\item{...}{optional arguments}

\item{T1}{model start time (Ma). Default is 3700}

\item{Y1}{207Pb/204Pb model starting composition. Default is 12.998}

\item{Mu1}{238U/204Pb model. Default is 9.74}

\item{U8U5}{Present-day 238U/235U ratio. Default is 137.88}

\item{L5}{235U decay constant. Default is 9.8485 * 10^-10}
}
\description{
This function calculates the 207Pb/204Pb ratio for a given time, either by using
Stacey & Kramers (1975) 2nd stage model parameters as default, or by setting
optional arguments.
}
\examples{
# Example of basic method using a hypothetical sample age of 2700 Ma
  Calc74(2700)

# Example of using optional arguments based on Stacey & Kramers (1975) 1st stage model
  Calc74(2700, T1 = 4570, Y1 = 10.294, Mu1 = 7.19)

# Example of using the optional argument for Mu1 = 8 only, and accepting the other defaults
  Calc74(2700, Mu1 = 8)
}
