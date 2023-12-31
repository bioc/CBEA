% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cbea_internals.R
\name{get_diagnostics}
\alias{get_diagnostics}
\title{Get diagnostic values using parent environment.}
\usage{
get_diagnostics(env = caller_env())
}
\value{
This function returns a list of two components:
\code{diagnostic} represent goodness-of-fit statistics for the
distribution fitting itself while \code{lmoment} contains
the l-moment comparisons between the computed raw scores,
permuted scores, and other fitted distributions.
}
\description{
This function is used internally inside fit_scores to grab the relevant objects
from the previous parent environment (i.e. the environment from fit_scores) and
compute relevant information. The role of this function is break diagnostic component into
a different function for maintenance.
}
\keyword{internal}
