% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auto_registries.R
\name{get_registries}
\alias{get_registries}
\title{List registries}
\usage{
get_registries(registry_id = NULL, ...)
}
\arguments{
\item{registry_id}{registries id}

\item{...}{additional query parameters; see Details below}
}
\value{
data from \code{registries} endpoint
}
\description{
List label templates.
List printers.
Manage registry objects.See our documentation on \href{https://docs.benchling.com/docs/registering-entities}{how to register entities}.
}
\details{
Available query parameters:
\describe{
\item{name}{Name of a registry. Restricts results to those with the specified name.}
\item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
}
}
