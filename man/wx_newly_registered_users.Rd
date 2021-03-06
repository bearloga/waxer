% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/users.R
\name{wx_newly_registered_users}
\alias{wx_newly_registered_users}
\title{Newly registered users counts}
\usage{
wx_newly_registered_users(
  project,
  granularity = c("daily", "monthly"),
  start_date = "20191101",
  end_date = "20191231"
)
}
\arguments{
\item{project}{The name of any Wikimedia project formatted like
\verb{\{language code\}.\{project name\}}, for example en.wikipedia. You may pass
en.wikipedia.org and the .org will be stripped off. For projects like
Wikimedia Commons (without language codes), use commons.wikimedia. For
projects like www.mediawiki.org, you can use that full string, or just use
mediawiki or mediawiki.org.}

\item{granularity}{The time unit for the response data. As of today,
supported values are daily (default) and monthly.}

\item{start_date}{The date of the first day to include, in YYYYMMDD format.
Can also be a \code{Date} or a \code{POSIXt} object, which will be auto-formatted.}

\item{end_date}{The date of the last day to include, in YYYYMMDD format.
Can also be a \code{Date} or a \code{POSIXt} object, which will be auto-formatted.}
}
\value{
A tibble data frame with columns
\describe{
\item{\code{project}}{project}
\item{\code{date}}{\code{Date}; beginning of the month if \code{granularity = "monthly"}}
\item{\code{new_registered_users}}{Number of newly registered users}
}
}
\description{
The count of users having registered themselves. This metric
excludes user-account created automatically through the auto-login
system, and accounts created by peers.
}
\details{
Thanks to \href{https://www.mediawiki.org/wiki/Extension:CentralAuth}{CentralAuth},
we now are sure that the same usernames in different wiki-projects belong to
the same user, and actually, only the first registration is counted in the
new registered users metric, since the system then automatically creates
user accounts at visit of other projects, and automatic account creations
are not counted.

However, for data \emph{before} CentralAuth, we have no way to know if two
accounts with the same name on different wikis belonged to the same user or
not. The metric provided for periods before CentralAuth does NOT deduplicate
accounts by name across projects, and therefore can be somehow overcounting
when used with project-families.
}
\section{Granularity}{

For "monthly" \code{granularity}, the \code{start_date} and \code{end_date} need to contain
the full month.

For example, \code{start_date = "20191101"} and
\code{end_date = "20191231"} would only give the monthly total for 2019-11. To
include 2019-12, use \code{end_date = "20200101"}.

Frustratingly, \code{start_date = "20191201"} and \code{end_date = "20191231"} does
\strong{\emph{not}} yield 2019-12 monthly total. Use \code{end_date = "20200101"} for that.
}

\section{License}{

Data retrieved from the API endpoint is available under the
\href{https://creativecommons.org/publicdomain/zero/1.0/}{CC0 1.0 license}.
}

\examples{
wx_newly_registered_users(
  "mr.wikipedia", # Marathi
  granularity = "monthly",
  start_date = "20190401",
  end_date = "20191001"
)
}
\seealso{
\href{https://wikitech.wikimedia.org/wiki/Analytics/AQS/Wikistats_2}{wikitech:Analytics/AQS/Wikistats 2}

Other {data & metrics on users}: 
\code{\link{wx_active_editors}()},
\code{\link{wx_top_editors}()}
}
\concept{{data & metrics on users}}
