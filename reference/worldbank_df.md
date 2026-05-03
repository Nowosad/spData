# World Bank data

The object loaded is a `data.frame` object containing data from World
Bank

## Usage

``` r
worldbank_df
```

## Format

Formal class 'data.frame'; the data contains a data.frame with 177 obs.
of 7 variables:

- name: character vector of country names

- iso_a2: character vector of ISO 2 character country codes

- HDI: human development index (HDI)

- urban_pop: urban population

- unemployment: unemployment, total (% of total labor force)

- pop_growth: population growth (annual %)

- literacy: adult literacy rate, population 15+ years, both sexes (%)

## Source

<https://data.worldbank.org/>

## See also

See the wbstats package: https://cran.r-project.org/web/packages/wbstats

## Examples

``` r
data(worldbank_df)
# or
worldbank_df <- read.csv(system.file("misc/worldbank_df.csv", package="spData"))

summary(worldbank_df)
#>         name           iso_a2         HDI           urban_pop        
#>  Length   :177   Length   :177   Min.   :0.2970   Min.   :    48439  
#>  N.unique :177   N.unique :173   1st Qu.:0.3725   1st Qu.:  2128406  
#>  N.blank  :  0   N.blank  :  0   Median :0.4540   Median :  5174900  
#>  Min.nchar:  4   Min.nchar:  2   Mean   :0.4681   Mean   : 22908339  
#>  Max.nchar: 35   Max.nchar:  2   3rd Qu.:0.5335   3rd Qu.: 15371796  
#>                  NAs      :  4   Max.   :0.7250   Max.   :742299307  
#>                                  NAs    :130      NAs    :9          
#>   unemployment      pop_growth         literacy    
#>  Min.   : 0.180   Min.   :-3.1072   Min.   :32.00  
#>  1st Qu.: 4.590   1st Qu.: 0.4992   1st Qu.:77.16  
#>  Median : 6.730   Median : 1.3529   Median :91.75  
#>  Mean   : 8.615   Mean   : 1.4752   Mean   :82.04  
#>  3rd Qu.:11.158   3rd Qu.: 2.3755   3rd Qu.:94.99  
#>  Max.   :28.030   Max.   : 6.5047   Max.   :99.98  
#>  NAs    :63       NAs    :9         NAs    :143    
```
