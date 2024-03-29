% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auto_nucleotide-alignments.R
\name{get_nucleotide_alignments}
\alias{get_nucleotide_alignments}
\title{List Nucleotide Alignments}
\usage{
get_nucleotide_alignments(alignment_id = NULL, ...)
}
\arguments{
\item{alignment_id}{nucleotide-alignments id}

\item{...}{additional query parameters; see Details below}
}
\value{
data from \code{nucleotide_alignments} endpoint
}
\description{
A Nucleotide Alignment is a Benchling object representing an alignment of
multiple DNA and/or RNA sequences.
}
\details{
Available query parameters:
\describe{
\item{pageSize}{Number of results to return. Defaults to 50, maximum of 100.}
\item{nextToken}{Token for pagination}
\item{modifiedAt}{Datetime, in RFC 3339 format. Supports the > and < operators. Time zone defaults to UTC. Restricts results to those modified in the specified range. e.g. > 2017-04-30.}
\item{name}{Name of a Nucleotide Alignment. Restricts results to those with the specified name.}
\item{nameIncludes}{Name substring of a Nucleotide Alignment. Restricts results to those with names that include the provided substring.}
\item{ids}{Comma-separated list of ids. Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
\item{names.anyOf}{Comma-separated list of names. Restricts results to those that match any of the specified names, case insensitive.  Warning - this filter can be non-performant due to case insensitivity.}
\item{names.anyOf.caseSensitive}{Comma-separated list of names. Restricts results to those that match any of the specified names, case sensitive.}
\item{sequenceIds}{Comma-separated list of sequence ids that own one or more Nucleotide Alignments (i.e. ids of sequences used as the template in a Template Alignment or created as the consensus sequence from a Consensus Alignment). Matches all of the provided IDs, or returns a 400 error that includes a list of which IDs are invalid.}
}
}
