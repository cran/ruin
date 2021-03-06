% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllClass.R
\docType{class}
\name{CramerLundbergCapitalInjections-class}
\alias{CramerLundbergCapitalInjections-class}
\title{A formal S4 class CramerLundbergCapitalInjections}
\description{
A formal S4 class representation of Cramer-Lundberg's extension that
includes capital injections.
}
\details{
The model is defined as follows:
\deqn{X_(t) = u + ct + \sum_{k=1}^{N^{(+)}(t)} Y^{(+)}_k -
\sum_{i=1}^{N^{(-)}(t)} Y^{(-)}_i}
where \eqn{u} is the initial capital (\code{initial_capital}), \eqn{c} is the
premium rate (\code{premium_rate}), \eqn{N^{(+)}(t)} is the Poisson process
of positive jumps (capital injections) with intensity \eqn{\lambda^{(+)}}
(\code{capital_injection_poisson_rate}), \eqn{Y^{(+)}_k} are
iid capital injections' sizes (\code{capital_injection_size_generator}
and \code{capital_injection_size_parameters}), \eqn{N^{(-)}(t)} is the
Poisson process of negative jumps (claims) with intensity \eqn{\lambda^{(-)}}
(\code{claim_poisson_arrival_rate}), \eqn{Y^{(-)}_i} are iid claim sizes
(\code{claim_size_generator} and \code{claim_size_parameters}).

Objects of class can be created only by using the constructor
\code{\link{CramerLundbergCapitalInjections}}.
}
\section{Slots}{

\describe{
\item{\code{initial_capital}}{a length one numeric non-negative vector specifying an
initial capital.}

\item{\code{premium_rate}}{a length one numeric non-negative vector specifying a
premium rate.}

\item{\code{claim_poisson_arrival_rate}}{a length one numeric positive vector
specifying the rate of the Poisson process of claims' arrivals.}

\item{\code{claim_size_generator}}{a function indicating the random generator of
claims' sizes.}

\item{\code{claim_size_parameters}}{a named list containing parameters for the
random generator of claims' sizes.}

\item{\code{capital_injection_poisson_rate}}{a length one numeric positive vector
specifying the rate of the Poisson process of capital injections' arrivals.}

\item{\code{capital_injection_size_generator}}{a function indicating the random
generator of capital injections' sizes.}

\item{\code{capital_injection_size_parameters}}{a named list containing parameters
for the random generator of capital injections' sizes.}
}}

\references{
Breuera L., Badescu A. L. \emph{A generalised Gerber Shiu measure for
Markov-additive risk processes with phase-type claims and capital
injections}. Scandinavian Actuarial Journal, 2014(2): 93-115, 2014.
}
\seealso{
\code{\link{CramerLundbergCapitalInjections}}
}
