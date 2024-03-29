% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/entries.R
\name{get_lookup_tables}
\alias{get_lookup_tables}
\title{Get Note Lookup Table (Structure)}
\usage{
get_lookup_tables(entry_id)
}
\arguments{
\item{entry_id}{entries id}
}
\value{
a \code{\link[tibble:tibble]{tibble::tibble()}} containing the lookup table names and Ids
}
\description{
Get Note Lookup Table (Structure)
}
\details{
Note: extract the contents with e.g.

\if{html}{\out{<div class="sourceCode">}}\preformatted{x <- get_lookup_tables(entry_id)
x$columns[[1]]
}\if{html}{\out{</div>}}

which returns the \code{columnId} and \code{name} but no contents.
}
