#' @name boston
#' @aliases boston boston.c boston.soi boston.utm
#' @title Corrected Boston Housing Data
#'
#' @description The \code{boston.c} data frame has 506 rows and 20 columns. It contains the Harrison and Rubinfeld (1978) data corrected for a few minor errors and augmented with the latitude and longitude of the observations. Gilley and Pace also point out that MEDV is censored, in that median values at or over USD 50,000 are set to USD 50,000. The original data set without the corrections is also included in package \code{mlbench} as \code{BostonHousing}. In addition, a matrix of tract point coordinates projected to UTM zone 19 is included as \code{boston.utm}, and a sphere of influence neighbours list as \code{boston.soi}.
#' 
#' @format   This data frame contains the following columns:
#' \itemize{
#'         \item{TOWN} {a factor with levels given by town names}
#'         \item{TOWNNO} {a numeric vector corresponding to TOWN}
#'         \item{TRACT} {a numeric vector of tract ID numbers}
#'         \item{LON} {a numeric vector of tract point longitudes in decimal degrees}
#'         \item{LAT} {a numeric vector of tract point latitudes in decimal degrees}
#'         \item{MEDV} {a numeric vector of median values of owner-occupied housing
#'                 in USD 1000}
#'         \item{CMEDV} {a numeric vector of corrected median values of
#'                 owner-occupied housing in USD 1000}
#'         \item{CRIM} {a numeric vector of per capita crime}
#'         \item{ZN} {a numeric vector of proportions of residential land zoned
#'                 for lots over 25000 sq. ft per town (constant for all Boston tracts)}
#'         \item{INDUS} {a numeric vector of proportions of non-retail business
#'                 acres per town (constant for all Boston tracts)}
#'         \item{CHAS} {a factor with levels 1 if tract borders Charles River;
#'                 0 otherwise}
#'         \item{NOX} {a numeric vector of nitric oxides concentration (parts per
#'                                                                     10 million) per town}
#'         \item{RM} {a numeric vector of average numbers of rooms per dwelling}
#'         \item{AGE} {a numeric vector of proportions of owner-occupied units
#'                 built prior to 1940}
#'         \item{DIS} {a numeric vector of weighted distances to five Boston
#'                 employment centres}
#'         \item{RAD} {a numeric vector of an index of accessibility to radial
#'                 highways per town (constant for all Boston tracts)}
#'         \item{TAX} {a numeric vector full-value property-tax rate per USD
#'                 10,000 per town (constant for all Boston tracts)}
#'         \item{PTRATIO} {a numeric vector of pupil-teacher ratios per town
#'                 (constant for all Boston tracts)}
#'         \item{B} {a numeric vector of \code{1000*(Bk - 0.63)^2} where Bk is the
#'                 proportion of blacks}
#'         \item{LSTAT} {a numeric vector of percentage values of lower status
#'                 population}
#' }
#' @note Details of the creation of the tract shapefile given in final don't run block; tract boundaries for 1990: \url{http://www.census.gov/geo/cob/bdy/tr/tr90shp/tr25_d90_shp.zip}, counties in the BOSTON SMSA \url{http://www.census.gov/population/metro/files/lists/historical/63mfips.txt}; tract conversion table 1980/1970: \url{https://www.icpsr.umich.edu/icpsrweb/ICPSR/studies/7913?q=07913&permit[0]=AVAILABLE}, \url{http://www.icpsr.umich.edu/cgi-bin/bob/zipcart2?path=ICPSR&study=7913&bundle=all&ds=1&dups=yes}
#' 
#' @source \url{http://lib.stat.cmu.edu/datasets/boston_corrected.txt}
#' @references 
#' Harrison, David, and Daniel L. Rubinfeld, Hedonic Housing Prices and the Demand for Clean Air, \emph{Journal of Environmental Economics and Management}, Volume 5, (1978), 81-102. Original data.
#' 
#' Gilley, O.W., and R. Kelley Pace, On the Harrison and Rubinfeld Data, \emph{Journal of Environmental Economics and Management}, 31 (1996),403-405. Provided corrections and examined censoring.
#' 
#' Pace, R. Kelley, and O.W. Gilley, Using the Spatial Configuration of the Data to Improve Estimation,  \emph{Journal of the Real Estate Finance and Economics}, 14 (1997), 333-340.
#' @docType data
#' @keywords datasets
#' 
#' @examples 
#' library(spdep)
#' data(boston)
#' hr0 <- lm(log(MEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2) + I(RM^2) +
#'                   AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT), data=boston.c)
#' summary(hr0)
#' logLik(hr0)
#' gp0 <- lm(log(CMEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2) + I(RM^2) +
#'                   AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT), data=boston.c)
#' summary(gp0)
#' logLik(gp0)
#' lm.morantest(hr0, nb2listw(boston.soi))
#' \dontrun{
#' library(maptools)
#' boston.tr <- readShapePoly(system.file("shapes/boston_tracts.shp",
#' #'                         package="spData")[1], ID="poltract",
#'                            proj4string=CRS(paste("+proj=longlat +datum=NAD27 
#'                            +no_defs +ellps=clrk66",
#'                            "+nadgrids=@conus,@alaska,@ntv2_0.gsb,@ntv1_can.dat")))
#' boston_nb <- poly2nb(boston.tr)
#' }
#' \dontrun{
#' gp1 <- errorsarlm(log(CMEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2)
#'                            + I(RM^2) +  AGE + log(DIS) + log(RAD) +
#'                             TAX + PTRATIO + B + log(LSTAT),
#'                            data=boston.c, nb2listw(boston.soi), method="Matrix", 
#'                            control=list(tol.opt = .Machine$double.eps^(1/4)))
#' summary(gp1)
#' gp2 <- lagsarlm(log(CMEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2) + I(RM^2)
#'                 +  AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT),
#'                 data=boston.c, nb2listw(boston.soi), method="Matrix")
#' summary(gp2)}
#' \dontrun{
#' ## Conversion table 1980/1970
#' # ICPSR_07913.zip
#' # 07913-0001-Data.txt
#' # http://dx.doi.org/10.3886/ICPSR07913.v1
#' # Provider: ICPSR
#' # Content: text/plain; charset="us-ascii"
#' # 
#' # TY  - DATA
#' # T1  - Census of Population and Housing 1980 [United States]:
#' # 1970-Pre 1980 Tract Relationships
#' # AU  - United States Department of Commerce. Bureau of the Census
#' # DO  - 10.3886/ICPSR07913.v1
#' # PY  - 1984-06-28
#' # UR  - http://dx.doi.org/10.3886/ICPSR07913.v1
#' # PB  - Inter-university Consortium for Political and Social Research
#' # (ICPSR) [distributor]
#' # ER  -
#' widths <- c(ID=5L, FIPS70State=2L, FIPS70cty=3L, Tract70=6L, FIPS80State=2L,
#'     FIPS80cty=3L, f1=7L, CTC=6L, f2=2L, intersect1=3L, intersect2=3L, name=30L)
#' dta0 <- read.fwf("07913-0001-Data.txt", unname(widths),
#'     col.names=names(widths), colClasses=rep("character", 12), as.is=TRUE)
#' sub <- grep("25", dta0$FIPS80State)
#' MA <- dta0[sub,]
#' ## match against boston data set
#' library(spdep)
#' data(boston)
#' bTR <- boston.c$TRACT
#' x1 <- match(as.integer(MA$Tract70), bTR)
#' BOSTON <- MA[!is.na(x1),]
#' ## MA 1990 tracts
#' library(rgdal)
#' MAtr90 <- readOGR(".", "tr25_d90")
#' ## counties in the BOSTON SMSA
#' BOSTON_SMSA <- MAtr90[MAtr90$CO %in% c("009", "017", "021", "023", "025"),]
#' proj4string(BOSTON_SMSA) <- CRS(paste("+proj=longlat +datum=NAD27 +no_defs",
#'       "+ellps=clrk66 +nadgrids=@conus,@alaska,@ntv2_0.gsb,@ntv1_can.dat"))
#' CTC4 <- substring(BOSTON$CTC, 1, 4)
#' CTC4u <- unique(CTC4)
#' TB_CTC4u <- match(BOSTON_SMSA$TRACTBASE, CTC4u)
#' ## match 1980 tracts with 1990
#' BOSTON_SMSA1 <- BOSTON_SMSA[!is.na(TB_CTC4u),]
#' ## union Polygons objects with same 1970 tract code
#' #library(rgeos)
#' BOSTON_SMSA2 <- unionSpatialPolygons(BOSTON_SMSA1,
#'      id=as.character(BOSTON_SMSA1$TRACTBASE))
#' #BOSTON_SMSA2 <- gUnaryUnion(BOSTON_SMSA1,
#' # id=as.character(BOSTON_SMSA1$TRACTBASE))
#' ## reorder data set
#' mm <- match(as.integer(as.character(row.names(BOSTON_SMSA2))), boston.c$TRACT)
#' df <- boston.c[mm,]
#' row.names(df) <- df$TRACT
#' row.names(BOSTON_SMSA2) <- as.character(as.integer(row.names(BOSTON_SMSA2)))
#' ## create SpatialPolygonsDataFrame
#' BOSTON_SMSA3 <- SpatialPolygonsDataFrame(BOSTON_SMSA2,
#'     data=data.frame(poltract=row.names(BOSTON_SMSA2),
#'     row.names=row.names(BOSTON_SMSA2)))
#' BOSTON_SMSA4 <- spCbind(BOSTON_SMSA3, df)
#' mm1 <- match(boston.c$TRACT, row.names(BOSTON_SMSA4))
#' BOSTON_SMSA5 <- BOSTON_SMSA4[mm1,]
#' #writeOGR(BOSTON_SMSA5, ".", "boston_tracts", driver="ESRI Shapefile",
#' # overwrite_layer=TRUE)
#' moran.test(boston.c$CMEDV, nb2listw(boston.soi))
#' moran.test(BOSTON_SMSA5$CMEDV, nb2listw(boston.soi))
#' }

NULL