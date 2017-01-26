#' @name house
#' @aliases house LO_nb trMat
#' @title Lucas county OH housing
#'
#' @description Data on 25,357 single family homes sold in Lucas County, Ohio, 1993-1998 from the county auditor, together with an \code{nb} neighbour object constructed as a sphere of influence graph from projected coordinates.
#' 
#' @format Formal class 'SpatialPointsDataFrame' [package "sp"] with 5 slots. The data slot is a data frame with 25357 observations on the following 24 variables.
#' \itemize{
#'         \item{price} {a numeric vector}
#'         \item{yrbuilt} {a numeric vector}
#'         \item{stories} {a factor with levels \code{one} \code{bilevel} \code{multilvl} \code{one+half} \code{two}     \code{two+half} \code{three}}
#'         \item{TLA} {a numeric vector}
#'         \item{wall} {a factor with levels \code{stucdrvt} \code{ccbtile} \code{metlvnyl} \code{brick} \code{stone} \code{wood} \code{partbrk}}
#'         \item{beds} {a numeric vector}
#'         \item{baths} {a numeric vector}
#'         \item{halfbaths} {a numeric vector}
#'         \item{frontage} {a numeric vector}
#'         \item{depth} {a numeric vector}
#'         \item{garage} {a factor with levels \code{no garage} \code{basement} \code{attached} \code{detached} \code{carport}}
#'         \item{garagesqft} {a numeric vector}
#'         \item{rooms} {a numeric vector}
#'         \item{lotsize} {a numeric vector}
#'         \item{sdate} {a numeric vector}
#'         \item{avalue} {a numeric vector}
#'         \item{s1993} {a numeric vector}
#'         \item{s1994} {a numeric vector}
#'         \item{s1995} {a numeric vector}
#'         \item{s1996} {a numeric vector}
#'         \item{s1997} {a numeric vector}
#'         \item{s1998} {a numeric vector}
#'         \item{syear} {a factor with levels \code{1993} \code{1994} \code{1995} \code{1996} \code{1997} \code{1998}}
#'         \item{age} {a numeric vector}
#' }
#' Its projection is \code{CRS(+init=epsg:2834)}, the Ohio North State Plane.
#' 
#' @source Dataset included in the Spatial Econometrics toolbox for Matlab, \url{http://www.spatial-econometrics.com/html/jplv7.zip}.
#' @docType data
#' @keywords datasets
#' 
#' @examples 
#' \dontrun{
#' house <- read.table("house.dat", header=FALSE)
#' names(house) <- c("price", "yrbuilt", "stories", "TLA", "wall", "beds",
#'                   "baths", "halfbaths", "frontage", "depth", "garage", "garagesqft", "rooms",
#'                   "lotsize", "sdate", "avalue", "long", "lat", "s1993", "s1994", "s1995",
#'                   "s1996", "s1997", "s1998")
#' house$syear <- 1992 + house$s1993 + 2*house$s1994 + 3*house$s1995 +
#'         4*house$s1996 + 5*house$s1997 + 6*house$s1998
#' house$syear <- factor(house$syear)
#' house$age <- (1999 - house$yrbuilt)/100
#' house$stories <- factor(house$stories, levels=1:7, 
#'     labels=c("one", "bilevel", "multilvl", "one+half", "two", "two+half", "three"))
#' house$wall <- factor(house$wall, levels=1:7, 
#'     labels=c("stucdrvt", "ccbtile", "metlvnyl", "brick", "stone", "wood", "partbrk"))
#' house$garage <- factor(house$garage, levels=0:4, 
#'     labels=c("no garage", "basement", "attached", "detached", "carport"))
#' library(sp)
#' coordinates(house) <- c("long", "lat")
#' proj4string(house) <- CRS("+proj=longlat")
#' library(rgdal)
#' house <- spTransform(house, CRS("+init=epsg:2834"))
#' library(spdep)
#' LO_nb <- graph2nb(soi.graph(tri2nb(coordinates(house)), coordinates(house)))
#' W <- as(as_dgRMatrix_listw(nb2listw(LO_nb)), "CsparseMatrix")
#' trMat <- trW(W, type="mult")}
#' 
#' library(sp)
#' data(house)
#' str(house)
#' plot(house)

NULL