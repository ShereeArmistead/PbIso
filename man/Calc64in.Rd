% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Calc64infunction.R
\name{Calc64in}
\alias{Calc64in}
\title{Calculate the initial 206Pb/204Pb ratio}
\usage{
# Basic usage accepting default model parameters for Stacey & Kramers (1975) 2nd stage model
  Calc64in(t, x, y, ...)

# Advanced usage with optional arguments
  Calc64in(t, x, y, T1, X1, Y1, U8U5, L5, L8)
}
\arguments{
\item{t}{sample age or time (Ma)}

\item{x}{sample 206Pb/204Pb ratio}

\item{y}{sample 207Pb/204Pb ratio}

\item{...}{optional arguments}

\item{T1}{model start time (Ma). Default is 3700}

\item{X1}{206Pb/204Pb model starting composition. Default is 11.152}

\item{Y1}{207Pb/204Pb model starting composition. Default is 12.998}

\item{U8U5}{Present-day 238U/235U ratio. Default is 137.88}

\item{L5}{235U decay constant. Default is 9.8485 * 10^-10}

\item{L8}{238U decay constant. Default is 1.55125 * 10^-10}
}
\description{
This function calculates the initial 206Pb/204Pb for a sample with a known age (t),
measured 206Pb/204Pb (x) and measured 207Pb/204Pb (y) ratios
}
\examples{
# Example of basic method using a hypothetical sample age of 2700 Ma, measured
# 206Pb/204Pb = 13.5 and 207Pb/204Pb = 14.5
  Calc64in(2700, 13.5, 14.5)

# Example of using additional optional arguments based on Stacey & Kramers (1975) 1st stage model
  Calc64in(2700, 13.5, 14.5, T1 = 4570, X1 = 9.307, Y1 = 10.294)

}
