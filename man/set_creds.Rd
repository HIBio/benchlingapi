% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/creds.R
\name{set_creds}
\alias{set_creds}
\title{Set Benchling Credentials}
\usage{
set_creds(
  org_var = "BENCHLING_ORG",
  token_var = "BENCHLING_TOKEN",
  validate = FALSE
)
}
\arguments{
\item{org_var}{environment variable containing the organisation prefix}

\item{token_var}{environment variable containing the user API token}

\item{validate}{When \code{TRUE} (default: \code{FALSE}), performs a check to see that
credentials are valid and throws an error if they fail.}
}
\value{
nothing; sets an internal environment variable
}
\description{
Set Benchling Credentials
}
