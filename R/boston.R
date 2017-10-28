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
#' @note Details of the creation of the tract shapefile given in final don't run block; tract boundaries for 1990: http://www.census.gov/geo/cob/bdy/tr/tr90shp/tr25_d90_shp.zip, counties in the BOSTON SMSA http://www.census.gov/population/metro/files/lists/historical/63mfips.txt; tract conversion table 1980/1970: \url{https://www.icpsr.umich.edu/icpsrweb/ICPSR/studies/7913?q=07913&permit[0]=AVAILABLE}, \url{http://www.icpsr.umich.edu/cgi-bin/bob/zipcart2?path=ICPSR&study=7913&bundle=all&ds=1&dups=yes}. The shapefile contains corrections and extra variables (tract 3592 is corrected to 3593; the extra columns are:
#'  \itemize{
#'    \item{units}{number of single family houses}
#'    \item{cu5k}{count of units under USD 5,000}
#'    \item{c5_7_5}{counts USD 5,000 to 7,500}
#'    \item{C*_*}{interval counts}
#'    \item{co50k}{count of units over USD 50,000}
#'    \item{median}{recomputed median values}
#'    \item{BB}{recomputed black population proportion}
#'    \item{censored}{whether censored or not}
#'    \item{NOXID}{NOX model zone ID}
#'    \item{POP}{tract population}
#'  }
#' 
#' @source \url{http://lib.stat.cmu.edu/datasets/boston_corrected.txt}
#' @references 
#' Harrison, David, and Daniel L. Rubinfeld, Hedonic Housing Prices and the Demand for Clean Air, \emph{Journal of Environmental Economics and Management}, Volume 5, (1978), 81-102. Original data.
#' 
#' Gilley, O.W., and R. Kelley Pace, On the Harrison and Rubinfeld Data, \emph{Journal of Environmental Economics and Management}, 31 (1996),403-405. Provided corrections and examined censoring.
#' 
#' Pace, R. Kelley, and O.W. Gilley, Using the Spatial Configuration of the Data to Improve Estimation,  \emph{Journal of the Real Estate Finance and Economics}, 14 (1997), 333-340.
#'
#' Bivand, Roger. Revisiting the Boston data set - Changing the units of observation affects estimated willingness to pay for clean air. REGION, v. 4, n. 1, p. 109-127, 2017. \url{http://openjournals.wu.ac.at/ojs/index.php/region/article/view/107}. 
#' 
#' @docType data
#' @keywords datasets spdep
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
#' library(rgdal)
#' boston.tr <- readOGR(system.file("shapes/boston_tracts.shp",
#'                            package="spData")[1])
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
#' summary(gp2)
#' }
NULL
