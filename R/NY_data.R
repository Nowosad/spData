#' @name NY_data
#' @aliases NY_data nydata listw_NY
#' @title New York leukemia data
#'
#' @description New York leukemia data taken from the data sets supporting Waller and Gotway 2004 (the data should be loaded by running \code{example(NY_data)} to demonstrate spatial data import techniques)
#' 
#' @format A data frame with 281 observations on the following 12 variables, and the binary coded spatial weights used in the source.
#' \itemize{
#' \item{AREANAME} {name of census tract}
#' \item{AREAKEY} {unique FIPS code for each tract}
#' \item{X} {x-coordinate of tract centroid (in km)}
#' \item{Y} {y-coordinate of tract centroid (in km)}
#' \item{POP8} {population size (1980 U.S. Census)}
#' \item{TRACTCAS} {number of cases 1978-1982}
#' \item{PROPCAS} {proportion of cases per tract}
#' \item{PCTOWNHOME} {percentage of people in each tract owning their own home}
#' \item{PCTAGE65P} {percentage of people in each tract aged 65 or more}
#' \item{Z} {ransformed propoprtions}
#' \item{AVGIDIST} {average distance between centroid and TCE sites}
#' \item{PEXPOSURE} {"exposure potential": inverse distance between each census tract centroid and the nearest TCE site, IDIST, transformed via log(100*IDIST)}
#' }
#' 
#' @details The examples section shows how the DBF files from the book website for Chapter 9 were converted into the \code{nydata} data frame and the \code{listw_NY} spatial weights list.
#' 
#' @source \url{http://www.sph.emory.edu/~lwaller/ch9index.htm}
#' @references Waller, L. and C. Gotway (2004) \emph{Applied Spatial Statistics for Public Health Data}. New York: John Wiley and Sons.
#' @docType data
#' @keywords datasets
#' 
#' @examples 
#' ## NY leukemia
#' library(foreign)
#' nydata <- read.dbf(system.file("misc/nydata.dbf", package="spData")[1])
#' library(sp)
#' coordinates(nydata) <- c("X", "Y")
#' nyadjmat <- as.matrix(read.dbf(system.file("misc/nyadjwts.dbf",
#'                                            package="spData")[1])[-1])
#' ID <- as.character(names(read.dbf(system.file("misc/nyadjwts.dbf",
#'                                               package="spData")[1]))[-1])
#' identical(substring(ID, 2, 10), substring(as.character(nydata$AREAKEY), 2, 10))
#' library(spdep)
#' nyadjlw <- mat2listw(nyadjmat, as.character(nydata$AREAKEY))
#' listw_NY <- nb2listw(nyadjlw$neighbours, style="B")

NULL