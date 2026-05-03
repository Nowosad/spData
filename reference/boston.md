# Corrected Boston Housing Data

The `boston.c` data frame has 506 rows and 20 columns. It contains the
Harrison and Rubinfeld (1978) data corrected for a few minor errors and
augmented with the latitude and longitude of the observations. Gilley
and Pace also point out that MEDV is censored, in that median values at
or over USD 50,000 are set to USD 50,000. The original data set without
the corrections is also included in package `mlbench` as
`BostonHousing`. In addition, a matrix of tract point coordinates
projected to UTM zone 19 is included as `boston.utm`, and a sphere of
influence neighbours list as `boston.soi`.

## Format

This data frame contains the following columns:

- TOWN: a factor with levels given by town names

- TOWNNO: a numeric vector corresponding to TOWN

- TRACT: a numeric vector of tract ID numbers

- LON: a numeric vector of tract point longitudes in decimal degrees

- LAT: a numeric vector of tract point latitudes in decimal degrees

- MEDV: a numeric vector of median values of owner-occupied housing in
  USD 1000

- CMEDV: a numeric vector of corrected median values of owner-occupied
  housing in USD 1000

- CRIM: a numeric vector of per capita crime

- ZN: a numeric vector of proportions of residential land zoned for lots
  over 25000 sq. ft per town (constant for all Boston tracts)

- INDUS: a numeric vector of proportions of non-retail business acres
  per town (constant for all Boston tracts)

- CHAS: a factor with levels 1 if tract borders Charles River; 0
  otherwise

- NOX: a numeric vector of nitric oxides concentration (parts per 10
  million) per town

- RM: a numeric vector of average numbers of rooms per dwelling

- AGE: a numeric vector of proportions of owner-occupied units built
  prior to 1940

- DIS: a numeric vector of weighted distances to five Boston employment
  centres

- RAD: a numeric vector of an index of accessibility to radial highways
  per town (constant for all Boston tracts)

- TAX: a numeric vector full-value property-tax rate per USD 10,000 per
  town (constant for all Boston tracts)

- PTRATIO: a numeric vector of pupil-teacher ratios per town (constant
  for all Boston tracts)

- B: a numeric vector of `1000*(Bk - 0.63)^2` where Bk is the proportion
  of blacks

- LSTAT: a numeric vector of percentage values of lower status
  population

## Source

Previously available from
http://lib.stat.cmu.edu/datasets/boston_corrected.txt

## Note

Details of the creation of the tract GPKG file: tract boundaries for
1990 (formerly at:
http://www.census.gov/geo/cob/bdy/tr/tr90shp/tr25_d90_shp.zip, counties
in the BOSTON SMSA
http://www.census.gov/population/metro/files/lists/historical/63mfips.txt);
tract conversion table 1980/1970 (formerly at :
https://www.icpsr.umich.edu/icpsrweb/ICPSR/studies/7913?q=07913&permit\[0\]=AVAILABLE,
http://www.icpsr.umich.edu/cgi-bin/bob/zipcart2?path=ICPSR&study=7913&bundle=all&ds=1&dups=yes).
The shapefile contains corrections and extra variables (tract 3592 is
corrected to 3593; the extra columns are:

- units: number of single family houses

- cu5k: count of units under USD 5,000

- c5_7_5: counts USD 5,000 to 7,500

- C\*\_\*: interval counts

- co50k: count of units over USD 50,000

- median: recomputed median values

- BB: recomputed black population proportion

- censored: whether censored or not

- NOXID: NOX model zone ID

- POP: tract population

## References

Harrison, David, and Daniel L. Rubinfeld, Hedonic Housing Prices and the
Demand for Clean Air, *Journal of Environmental Economics and
Management*, Volume 5, (1978), 81-102. Original data.

Gilley, O.W., and R. Kelley Pace, On the Harrison and Rubinfeld Data,
*Journal of Environmental Economics and Management*, 31 (1996),403-405.
Provided corrections and examined censoring.

Pace, R. Kelley, and O.W. Gilley, Using the Spatial Configuration of the
Data to Improve Estimation, *Journal of the Real Estate Finance and
Economics*, 14 (1997), 333-340.

Bivand, Roger. Revisiting the Boston data set - Changing the units of
observation affects estimated willingness to pay for clean air. REGION,
v. 4, n. 1, p. 109-127, 2017.
<https://openjournals.wu.ac.at/ojs/index.php/region/article/view/107>.

## Examples

``` r
if (requireNamespace("spdep", quietly = TRUE)) {
  data(boston)
  hr0 <- lm(log(MEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2) + I(RM^2) +
                    AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT), data = boston.c)
  summary(hr0)
  logLik(hr0)
  gp0 <- lm(log(CMEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2) + I(RM^2) +
                    AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT), data = boston.c)
  summary(gp0)
  logLik(gp0)
  spdep::lm.morantest(hr0, spdep::nb2listw(boston.soi))
}
#> 
#>  Global Moran I for regression residuals
#> 
#> data:  
#> model: lm(formula = log(MEDV) ~ CRIM + ZN + INDUS + CHAS + I(NOX^2) +
#> I(RM^2) + AGE + log(DIS) + log(RAD) + TAX + PTRATIO + B + log(LSTAT),
#> data = boston.c)
#> weights: spdep::nb2listw(boston.soi)
#> 
#> Moran I statistic standard deviate = 14.509, p-value < 2.2e-16
#> alternative hypothesis: greater
#> sample estimates:
#> Observed Moran I      Expectation         Variance 
#>     0.4364296993    -0.0168870829     0.0009762383 
#> 
if (requireNamespace("sf", quietly = TRUE)) {
boston.tr <- sf::st_read(system.file("shapes/boston_tracts.gpkg",
                           package="spData")[1])
  if (requireNamespace("spdep", quietly = TRUE)) {
    boston_nb <- spdep::poly2nb(boston.tr)
  }
}
#> Reading layer `boston_tracts' from data source 
#>   `/home/runner/work/_temp/Library/spData/shapes/boston_tracts.gpkg' 
#>   using driver `GPKG'
#> Simple feature collection with 506 features and 36 fields
#> Geometry type: POLYGON
#> Dimension:     XY
#> Bounding box:  xmin: -71.52311 ymin: 42.00305 xmax: -70.63823 ymax: 42.67307
#> Geodetic CRS:  NAD27
```
