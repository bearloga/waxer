% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{wx_bucket_items}
\alias{wx_bucket_items}
\title{Bucket items}
\usage{
wx_bucket_items(items, bucket_size)
}
\arguments{
\item{items}{A vector of items}

\item{bucket_size}{Maximum number of items a bucket may have}
}
\value{
A list with each element containing no more than \code{bucket_size} number
of items. Flattening the returned list would yield the original \code{items}
vector.
}
\description{
Split a vector of items into buckets not exceeding some maximum
bucket size. Useful for making fewer MediaWiki API calls when an endpoint
accepts multiple page titles per call (for example).
}
