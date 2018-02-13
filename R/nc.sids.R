#' @name nc.sids
#' @aliases nc.sids ncCR85.nb ncCC89.nb sidspolys sidscents
#' @title North Carolina SIDS data
#'
#' @description (Use \code{example(nc.sids)} to read the data set from shapefile, together with import of two different list of neighbours). 
#' The \code{nc.sids} data frame has 100 rows and 21 columns. It contains data given in Cressie (1991, pp. 386-9), Cressie and Read (1985) and Cressie and Chan (1989) on sudden infant deaths in North Carolina for 1974-78 and 1979-84. The data set also contains the neighbour list given by Cressie and Chan (1989) omitting self-neighbours (ncCC89.nb), and the neighbour list given by Cressie and Read (1985) for contiguities (ncCR85.nb). The data are ordered by county ID number, not alphabetically as in the source tables \code{sidspolys} is a "polylist" object of polygon boundaries, and \code{sidscents} is a matrix of their centroids.
#' 
#' @format 
#' This data frame contains the following columns:
#' \itemize{
#'         \item{SP_ID} {SpatialPolygons ID}
#'         \item{CNTY_ID} {county ID}
#'         \item{east} {eastings, county seat, miles, local projection}
#'         \item{north} {northings, county seat, miles, local projection}
#'         \item{L_id} {Cressie and Read (1985) L index}
#'         \item{M_id} {Cressie and Read (1985) M index}
#'         \item{names} {County names}
#'         \item{AREA} {County polygon areas in degree units}
#'         \item{PERIMETER} {County polygon perimeters in degree units}
#'         \item{CNTY_} {Internal county ID}
#'         \item{NAME} {County names}
#'         \item{FIPS} {County ID}
#'         \item{FIPSNO} {County ID}
#'         \item{CRESS_ID} {Cressie papers ID}
#'         \item{BIR74} {births, 1974-78}
#'         \item{SID74} {SID deaths, 1974-78}
#'         \item{NWBIR74} {non-white births, 1974-78}
#'         \item{BIR79} {births, 1979-84}
#'         \item{SID79} {SID deaths, 1979-84}
#'         \item{NWBIR79} {non-white births, 1979-84}
#' }
#' 
#' @source Cressie, N (1991), \emph{Statistics for spatial data}. New York: Wiley, pp. 386--389; Cressie, N, Chan NH (1989) Spatial modelling of regional variables. \emph{Journal of the American Statistical Association}, 84, 393--401; Cressie, N, Read, TRC (1985) Do sudden infant deaths come in clusters? \emph{Statistics and Decisions} Supplement Issue 2, 333--349; http://sal.agecon.uiuc.edu/datasets/sids.zip.
#' @docType data
#' @keywords datasets spdep
#' 
#' @examples 
#' if (requireNamespace("rgdal", quietly = TRUE)) {
#'   library(rgdal)
#'   if (requireNamespace("spdep", quietly = TRUE)) {
#'     library(spdep)
#'     nc.sids <- readOGR(system.file("shapes/sids.shp", package="spData")[1])
#'     proj4string(nc.sids) <- CRS("+proj=longlat +ellps=clrk66")
#'     row.names(nc.sids) <- as.character(nc.sids$FIPS)
#'     rn <- row.names(nc.sids)
#'     ncCC89_nb <- read.gal(system.file("weights/ncCC89.gal", package="spData")[1],
#'                           region.id=rn)
#'     ncCR85_nb <- read.gal(system.file("weights/ncCR85.gal", package="spData")[1],
#'                           region.id=rn)
#'                           
#'     plot(nc.sids, border="grey")
#'     plot(ncCR85_nb, coordinates(nc.sids), add=TRUE, col="blue")
#'     plot(nc.sids, border="grey")
#'     plot(ncCC89_nb, coordinates(nc.sids), add=TRUE, col="blue")
#'   }
#' }
"nc.sids"
