#' @name columbus
#' @aliases columbus col.gal.nb coords polys bbs
#' @title Columbus OH spatial analysis data set
#'
#' @description The \code{columbus} data frame has 49 rows and 22 columns. Unit of analysis: 49 neighbourhoods in Columbus, OH, 1980 data. In addition the data set includes a \code{polylist} object \code{polys} with the boundaries of the neighbourhoods, a matrix of polygon centroids \code{coords}, and \code{col.gal.nb}, the neighbours list from an original GAL-format file. The matrix \code{bbs} is DEPRECATED, but retained for other packages using this data set.
#' 
#' @format This data frame contains the following columns:
#'        \itemize{
#'                \item{AREA} {computed by ArcView}
#'                \item{PERIMETER} {computed by ArcView}
#'                \item{COLUMBUS_} {internal polygon ID (ignore)}
#'                \item{COLUMBUS_I} {another internal polygon ID (ignore)}
#'                \item{POLYID} {yet another polygon ID}
#'                \item{NEIG} {neighborhood id value (1-49);
#'                        conforms to id value used in Spatial Econometrics book.}
#'                \item{HOVAL} {housing value (in 1,000 USD)}
#'                \item{INC} {household income (in 1,000 USD)}
#'                \item{CRIME} {residential burglaries and vehicle thefts per thousand
#'                        households in the neighborhood}
#'                \item{OPEN} {open space in neighborhood}
#'                \item{PLUMB} {percentage housing units without plumbing}
#'                \item{DISCBD} {distance to CBD}
#'                \item{X} {x coordinate (in arbitrary digitizing units, not polygon coordinates)}
#'                \item{Y} {y coordinate (in arbitrary digitizing units, not polygon coordinates)}
#'                \item{NSA} {north-south dummy (North=1)}
#'                \item{NSB} {north-south dummy (North=1)}
#'                \item{EW} {east-west dummy (East=1)}
#'                \item{CP} {core-periphery dummy (Core=1)}
#'                \item{THOUS} {constant=1,000}
#'                \item{NEIGNO} {NEIG+1,000, alternative neighborhood id value}
#'        }
#' @details The row names of \code{columbus} and the \code{region.id} attribute of \code{polys} are set to \code{columbus$NEIGNO}.
#' @source Anselin, Luc.  1988.  Spatial econometrics: methods and models.  Dordrecht: Kluwer Academic, Table 12.1 p. 189.
#' @note All source data files prepared by Luc Anselin, Spatial Analysis Laboratory, Department of Agricultural and Consumer Economics, University of Illinois, Urbana-Champaign, http://sal.agecon.uiuc.edu/datasets/columbus.zip.
#' @docType data
#' @keywords datasets sp spdep
#' 
#' @examples 
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   library(sp)
#'   columbus <- sf::st_read(system.file("shapes/columbus.shp", package="spData")[1])
#'   columbus <- as(columbus, "Spatial")
#'   plot(columbus)
#' }
#' 
#' if (requireNamespace("spdep", quietly = TRUE)) {
#'   library(spdep)
#'   col.gal.nb <- read.gal(system.file("weights/columbus.gal", package="spData")[1])
#' }
"columbus"
