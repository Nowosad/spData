\name{NY_data}
\alias{NY_data}
\alias{nydata}
\alias{listw_NY}
\docType{data}
\title{New York leukemia data}
\description{
  New York leukemia data taken from the data sets supporting Waller and Gotway 2004 (the data should be loaded by running \code{example(NY_data)} to demonstrate spatial data import techniques).
}
\usage{data(NY_data)}
\format{
  A data frame with 281 observations on the following 12 variables, and the binary coded spatial weights used in the source.
  \describe{
    \item{\code{AREANAME}}{name of census tract}
    \item{\code{AREAKEY}}{unique FIPS code for each tract}
    \item{\code{X}}{x-coordinate of tract centroid (in km)}
    \item{\code{Y}}{y-coordinate of tract centroid (in km)}
    \item{\code{POP8}}{population size (1980 U.S. Census)}
    \item{\code{TRACTCAS}}{number of cases 1978-1982}
    \item{\code{PROPCAS}}{proportion of cases per tract}
    \item{\code{PCTOWNHOME}}{percentage of people in each tract owning their own home}
    \item{\code{PCTAGE65P}}{percentage of people in each tract aged 65 or more}
    \item{\code{Z}}{ransformed propoprtions}
    \item{\code{AVGIDIST}}{average distance between centroid and TCE sites}
    \item{\code{PEXPOSURE}}{"exposure potential": inverse distance between each census tract centroid and the nearest TCE site, IDIST, transformed via log(100*IDIST)}
  }
}
\details{
  The examples section shows how the DBF files from the book website for Chapter 9 were converted into the \code{nydata} data frame and the \code{listw_NY} spatial weights list.
}
\source{
  \url{http://www.sph.emory.edu/~lwaller/ch9index.htm}
}
\references{
  Waller, L. and C. Gotway (2004) \emph{Applied Spatial Statistics for Public Health Data}. New York: John Wiley and Sons.
}
\examples{
## NY leukemia
library(foreign)
nydata <- read.dbf(system.file("etc/misc/nydata.dbf", package="spdep")[1])
library(sp)
coordinates(nydata) <- c("X", "Y")
nyadjmat <- as.matrix(read.dbf(system.file("etc/misc/nyadjwts.dbf",
 package="spdep")[1])[-1])
ID <- as.character(names(read.dbf(system.file("etc/misc/nyadjwts.dbf",
 package="spdep")[1]))[-1])
identical(substring(ID, 2, 10), substring(as.character(nydata$AREAKEY), 2, 10))
library(spdep)
nyadjlw <- mat2listw(nyadjmat, as.character(nydata$AREAKEY))
listw_NY <- nb2listw(nyadjlw$neighbours, style="B")
}
\keyword{datasets}
