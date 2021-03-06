% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tabe.R
\name{scion}
\alias{scion}
\title{scion}
\usage{
scion(.data, ..., false_fun, false_name, false_env)
}
\arguments{
\item{.data}{A tbl or something that can be coerced into one}

\item{...}{conditions that will be passed to dplyr::filter}

\item{false_fun}{A function or functional that will be applied to the data that doesn't pass the supplied filters (the scion)}

\item{false_name}{optional, the name of the object to which the scion will be assigned.}

\item{false_env}{optional, the environment into which the scion will be assigned. If specified, false_name must also be specified.
If unspecified (default), scions will be placed into the internal package environment.}
}
\value{
A tbl whose rows have passed the stated conditions
}
\description{
scion
}
\details{
\code{.data} will be split into two chunks based on the conditions. The scion will be passed through \code{false_fun} and then either placed on
the package's internal stack or assigned as specified by \code{false_name} and \code{false_env}.
}
\examples{
library(dplyr)
aframe <- data.frame(zed = runif(100))
set_to_zero <- . \%>\% mutate(zed = 0)
aframe \%>\% scion(zed >0.5, false_fun=set_to_zero) \%>\% mutate(zed=1) \%>\% graft

}
\author{
Seth Wenchel
}
