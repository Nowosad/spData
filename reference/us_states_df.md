# the American Community Survey (ACS) data

The object loaded is a `data.frame` object containing the US states data
from the American Community Survey (ACS)

## Usage

``` r
us_states_df
```

## Format

Formal class 'data.frame'; the data contains a data.frame with 51 obs.
of 5 variables:

- state: character vector of state names

- median_income_10: numerical vector of median income in 2010

- median_income_15: numerical vector of median income in 2010

- poverty_level_10: numerical vector of number of people with income
  below poverty level in 2010

- poverty_level_15: numerical vector of number of people with income
  below poverty level in 2015

## Source

<https://www.census.gov/programs-surveys/acs/>

## See also

See the tidycensus package:
https://cran.r-project.org/package=tidycensus

## Examples

``` r
data(us_states_df)

summary(us_states_df)
#>        state    median_income_10 median_income_15 poverty_level_10 
#>  Length   :51   Min.   :20019    Min.   :21438    Min.   :  52297  
#>  N.unique :51   1st Qu.:23995    1st Qu.:24952    1st Qu.: 204702  
#>  N.blank  : 0   Median :25432    Median :26943    Median : 577247  
#>  Min.nchar: 4   Mean   :26144    Mean   :27500    Mean   : 802304  
#>  Max.nchar:20   3rd Qu.:29072    3rd Qu.:30376    3rd Qu.: 822568  
#>                 Max.   :35264    Max.   :40884    Max.   :4919945  
#>  poverty_level_15 
#>  Min.   :  64995  
#>  1st Qu.: 238146  
#>  Median : 636947  
#>  Mean   : 936256  
#>  3rd Qu.: 961445  
#>  Max.   :6135142  
```
