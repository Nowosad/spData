\name{SplashDams}
\alias{SplashDams}
\docType{data}
\title{Data for Splash Dams in western Oregon}
\description{
Data for Splash Dams in western Oregon
}
\usage{data(SplashDams)}
\format{
  The format is:
Formal class 'SpatialPointsDataFrame' [package "sp"] with 5 slots
  ..@ data       :'data.frame':	232 obs. of  6 variables:
  .. ..$ streamName  : Factor w/ 104 levels "Abiqua Creek",..: 12 12 60 60 60 49 49 9 9 18 ...
  .. ..$ locationCode: Factor w/ 3 levels "h","l","m": 1 1 1 1 1 1 1 1 1 1 ...
  .. ..$ height      : int [1:232] 4 4 NA NA NA NA 10 NA NA NA ...
  .. ..$ lastDate    : int [1:232] 1956 1956 1957 1936 1936 1929 1909 1919 1919 1919 ...
  .. ..$ owner       : Factor w/ 106 levels "A. Stefani","A.H. Blakesley",..: 42 42 42 84 84 24 24 25 25 25 ...
  .. ..$ datesUsed   : Factor w/ 118 levels "?-1870s-1899-?",..: 92 92 93 91 91 72 61 94 94 94 ...
  ..@ coords.nrs : num(0) 
  ..@ coords     : num [1:232, 1:3] -124 -124 -124 -124 -124 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : NULL
  .. .. ..$ : chr [1:3] "coords.x1" "coords.x2" "coords.x3"
  ..@ bbox       : num [1:3, 1:2] -124.2 42.9 0 -122.4 46.2 ...
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:3] "coords.x1" "coords.x2" "coords.x3"
  .. .. ..$ : chr [1:2] "min" "max"
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slots
  .. .. ..@ projargs: chr " +proj=longlat +ellps=WGS84"
}
\source{R. R. Miller (2010) Is the Past Present? Historical Splash-dam Mapping and Stream Disturbance Detection in the Oregon Coastal Province. MSc. thesis, Oregon State University; packaged by Jonathan Callahan}
\references{\url{http://www.fs.fed.us/pnw/lwm/aem/docs/burnett/miller_rebecca_r2010rev.pdf}}
\examples{
data(SplashDams)
library(sp)
plot(SplashDams, axes=TRUE)
}
\keyword{datasets}
