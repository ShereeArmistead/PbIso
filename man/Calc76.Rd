% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Calc76function.R
\name{Calc76}
\alias{Calc76}
\title{Calculate the 207Pb/206Pb ratio}
\usage{
Calc76(t, ..., U8U5 = 137.88, L5 = 9.8485 * 10^-10, L8 = 1.55125 * 10^-10)
}
\arguments{
\item{t}{sample age or time (Ma)}

\item{...}{optional arguments}

\item{U8U5}{Present-day 238U/235U ratio. Default is 137.88}

\item{L5}{235U decay constant. Default is 9.8485 * 10^-10}

\item{L8}{238U decay constant. Default is 1.55125 * 10^-10}
}
\description{
This function calculates the 207Pb/206Pb ratio for a given time, either by using
Stacey & Kramers (1975) 2nd stage model parameters as default, or by setting
optional arguments.
}
