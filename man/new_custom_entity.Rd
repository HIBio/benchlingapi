% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/post_custom_entity.R
\name{new_custom_entity}
\alias{new_custom_entity}
\title{Add a new custom-entity to the registry}
\usage{
new_custom_entity(type = NULL, name = NULL, id = NULL, dry_run = TRUE, ...)
}
\arguments{
\item{type}{type of custom-entity}

\item{name}{name of the custom-entity}

\item{id}{id of the custom-entity. If provided, this will be used as the
\code{entityRegistryId}, otherwise the \code{namingStrategy} used will be \code{"NEW_IDS"}}

\item{dry_run}{set to \code{TRUE} to actually push to benchling}

\item{...}{field entries. See \code{\link[=get_schema_data_by_name]{get_schema_data_by_name()}} for details of
which fields the schema requires, with the appropriate \code{type}}
}
\value{
if \code{dry_run == TRUE} the response from the server, otherwise \code{FALSE}
}
\description{
Add a new custom-entity to the registry
}
