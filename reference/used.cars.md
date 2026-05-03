# US 1960 used car prices

The `used.cars` data frame has 48 rows and 2 columns. The data set
includes a neighbours list for the 48 states excluding DC from
poly2nb().

## Usage

``` r
used.cars
```

## Format

This data frame contains the following columns:

- tax.charges: taxes and delivery charges for 1955-9 new cars

- price.1960: 1960 used car prices by state

## Source

Hanna, F. A. 1966 Effects of regional differences in taxes and transport
charges on automobile consumption, in Ostry, S., Rhymes, J. K. (eds)
Papers on regional statistical studies, Toronto: Toronto University
Press, pp. 199-223.

## References

Hepple, L. W. 1976 A maximum likelihood model for econometric estimation
with spatial series, in Masser, I (ed) Theory and practice in regional
science, London: Pion, pp. 90-104.

## Examples

``` r
if (requireNamespace("spdep", quietly = TRUE)) {
  library(spdep)
  data(used.cars)
  moran.test(used.cars$price.1960, nb2listw(usa48.nb))
  moran.plot(used.cars$price.1960, nb2listw(usa48.nb),
           labels=rownames(used.cars))
  uc.lm <- lm(price.1960 ~ tax.charges, data=used.cars)
  summary(uc.lm)

  lm.morantest(uc.lm, nb2listw(usa48.nb))
  lm.morantest.sad(uc.lm, nb2listw(usa48.nb))
  lm.LMtests(uc.lm, nb2listw(usa48.nb))
# \donttest{
  if (requireNamespace("spatialreg", quietly = TRUE)) {
    library(spatialreg)
    uc.err <- errorsarlm(price.1960 ~ tax.charges, data=used.cars,
                       nb2listw(usa48.nb), tol.solve=1.0e-13, 
                       control=list(tol.opt=.Machine$double.eps^0.3))
    summary(uc.err)
    uc.lag <- lagsarlm(price.1960 ~ tax.charges, data=used.cars,
                     nb2listw(usa48.nb), tol.solve=1.0e-13, 
                     control=list(tol.opt=.Machine$double.eps^0.3))
    summary(uc.lag)
    uc.lag1 <- lagsarlm(price.1960 ~ 1, data=used.cars,
                      nb2listw(usa48.nb), tol.solve=1.0e-13, 
                      control=list(tol.opt=.Machine$double.eps^0.3))
    summary(uc.lag1)
    uc.err1 <- errorsarlm(price.1960 ~ 1, data=used.cars,
                        nb2listw(usa48.nb), tol.solve=1.0e-13, 
                        control=list(tol.opt=.Machine$double.eps^0.3),
                        Durbin=FALSE)
    summary(uc.err1)
  }
# }
}

#> Please update scripts to use lm.RStests in place of lm.LMtests
#> Loading required package: Matrix
#> 
#> Attaching package: ‘spatialreg’
#> The following objects are masked from ‘package:spdep’:
#> 
#>     get.ClusterOption, get.VerboseOption, get.ZeroPolicyOption,
#>     get.coresOption, get.mcOption, set.ClusterOption,
#>     set.VerboseOption, set.ZeroPolicyOption, set.coresOption,
#>     set.mcOption
#> 
#> Call:
#> errorsarlm(formula = price.1960 ~ 1, data = used.cars, listw = nb2listw(usa48.nb), 
#>     Durbin = FALSE, tol.solve = 1e-13, control = list(tol.opt = .Machine$double.eps^0.3))
#> 
#> Residuals:
#>      Min       1Q   Median       3Q      Max 
#> -76.1518 -18.2214   5.2489  21.6309  63.4983 
#> 
#> Type: error 
#> Coefficients: (asymptotic standard errors) 
#>             Estimate Std. Error z value  Pr(>|z|)
#> (Intercept) 1542.607     27.321  56.462 < 2.2e-16
#> 
#> Lambda: 0.82919, LR test value: 54.202, p-value: 1.8086e-13
#> Asymptotic standard error: 0.070993
#>     z-value: 11.68, p-value: < 2.22e-16
#> Wald statistic: 136.42, p-value: < 2.22e-16
#> 
#> Log likelihood: -240.977 for error model
#> ML residual variance (sigma squared): 1045.4, (sigma: 32.333)
#> Number of observations: 48 
#> Number of parameters estimated: 3 
#> AIC: 487.95, (AIC for lm: 540.16)
#> 
```
