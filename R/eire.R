#' @name eire
#' @aliases eire eire.df eire.polys.utm eire.coords.utm eire.nb
#' @title Eire data sets
#'
#' @description The Eire data set has been converted to shapefile format and placed in the etc/shapes directory. The initial data objects are now stored as a SpatialPolygonsDataFrame object, from which the contiguity neighbour list is recreated. For purposes of record, the original data set is retained. 
#' The \code{eire.df} data frame has 26 rows and 9 columns. In addition, polygons of the 26 counties are provided as a multipart polylist in eire.polys.utm (coordinates in km, projection UTM zone 30). Their centroids are in eire.coords.utm. The original Cliff and Ord binary contiguities are in eire.nb.
#' 
#' @format This data frame contains the following columns:
#' \itemize{
#'         \item{A} {Percentage of sample with blood group A}
#'         \item{towns} {Towns/unit area}
#'         \item{pale} {Beyond the Pale 0, within the Pale 1}
#'         \item{size} {number of blood type samples}
#'         \item{ROADACC} {arterial road network accessibility in 1961}
#'         \item{OWNCONS} {percentage in value terms of gross agricultural output of each county consumed by itself}
#'         \item{POPCHG} {1961 population as percentage of 1926}
#'         \item{RETSALE} {value of retail sales British Pound000}
#'         \item{INCOME} {total personal income British Pound000}
#'         \item{names} {County names}
#' }
#' 
#' @source Upton and Fingleton 1985, - Bailey and Gatrell 1995, ch. 1 for blood group data, Cliff and Ord (1973), p. 107 for remaining variables (also after O'Sullivan, 1968). Polygon borders and Irish data sourced from Michael Tiefelsdorf's SPSS Saddlepoint bundle, originally hosted at: \url{http://geog-www.sbs.ohio-state.edu/faculty/tiefelsdorf/GeoStat.htm}.
#' @docType data
#' @keywords datasets sp spdep
#' 
#' @examples 
#' library(maptools)
#' library(rgdal)
#' library(spdep)
#' eire <- readOGR(system.file("shapes/eire.shp", package="spData")[1])
#' eire.nb <- poly2nb(eire)
#' 
#' # data(eire)
#' # Eire physical anthropology blood group data
#' summary(eire$A)
#' brks <- round(fivenum(eire$A), digits=2)
#' cols <- rev(heat.colors(4))
#' plot(eire, col=cols[findInterval(eire$A, brks, all.inside=TRUE)])
#' title(main="Percentage with blood group A in Eire")
#' legend(x=c(-50, 70), y=c(6120, 6050), leglabs(brks), fill=cols, bty="n")
#' 
#' plot(eire)
#' plot(eire.nb, coordinates(eire), add=TRUE)
#' 
#' lA <- lag.listw(nb2listw(eire.nb), eire$A)
#' summary(lA)
#' moran.test(eire$A, nb2listw(eire.nb))
#' geary.test(eire$A, nb2listw(eire.nb))
#' cor(lA, eire$A)
#' moran.plot(eire$A, nb2listw(eire.nb), labels=eire$names)
#' A.lm <- lm(A ~ towns + pale, data=eire)
#' summary(A.lm)
#' res <- residuals(A.lm)
#' brks <- c(min(res),-2,-1,0,1,2,max(res))
#' cols <- rev(cm.colors(6))
#' 
#' plot(eire, col=cols[findInterval(res, brks, all.inside=TRUE)])
#' title(main="Regression residuals")
#' legend(x=c(-50, 70), y=c(6120, 6050), legend=leglabs(brks), fill=cols, bty="n")
#' 
#' lm.morantest(A.lm, nb2listw(eire.nb))
#' lm.morantest.sad(A.lm, nb2listw(eire.nb))
#' lm.LMtests(A.lm, nb2listw(eire.nb), test="LMerr")
#' 
#' # Eire agricultural data
#' brks <- round(fivenum(eire$OWNCONS), digits=2)
#' cols <- grey(4:1/5)
#' plot(eire, col=cols[findInterval(eire$OWNCONS, brks, all.inside=TRUE)])
#' title(main="Percentage own consumption of agricultural produce")
#' legend(x=c(-50, 70), y=c(6120, 6050), legend=leglabs(brks), fill=cols, bty="n")
#' 
#' moran.plot(eire$OWNCONS, nb2listw(eire.nb))
#' moran.test(eire$OWNCONS, nb2listw(eire.nb))
#' e.lm <- lm(OWNCONS ~ ROADACC, data=eire)
#' res <- residuals(e.lm)
#' brks <- c(min(res),-2,-1,0,1,2,max(res))
#' cols <- rev(cm.colors(6))
#' plot(eire, col=cols[findInterval(res, brks, all.inside=TRUE)])
#' title(main="Regression residuals")
#' legend(x=c(-50, 70), y=c(6120, 6050), legend=leglabs(brks), fill=cm.colors(6), bty="n")
#' 
#' lm.morantest(e.lm, nb2listw(eire.nb))
#' lm.morantest.sad(e.lm, nb2listw(eire.nb))
#' lm.LMtests(e.lm, nb2listw(eire.nb), test="LMerr")
#' print(localmoran.sad(e.lm, eire.nb, select=1:length(slot(eire, "polygons"))))
#' 

NULL