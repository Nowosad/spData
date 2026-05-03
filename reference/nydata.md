# New York leukemia data

New York leukemia data taken from the data sets supporting Waller and
Gotway 2004 (the data should be loaded by running `example(NY_data)` to
demonstrate spatial data import techniques)

## Usage

``` r
nydata
```

## Format

A data frame with 281 observations on the following 12 variables, and
the binary coded spatial weights used in the source.

- AREANAME: name of census tract

- AREAKEY: unique FIPS code for each tract

- X: x-coordinate of tract centroid (in km)

- Y: y-coordinate of tract centroid (in km)

- POP8: population size (1980 U.S. Census)

- TRACTCAS: number of cases 1978-1982

- PROPCAS: proportion of cases per tract

- PCTOWNHOME: percentage of people in each tract owning their own home

- PCTAGE65P: percentage of people in each tract aged 65 or more

- Z: ransformed propoprtions

- AVGIDIST: average distance between centroid and TCE sites

- PEXPOSURE: "exposure potential": inverse distance between each census
  tract centroid and the nearest TCE site, IDIST, transformed via
  log(100\*IDIST)

- Cases: as TRACTCAS with more digits

- Xm: X in metres

- Ym: Y in metres

- Xshift: feature offset

- Yshift: feature offset

## Source

http://www.sph.emory.edu/~lwaller/ch9index.htm

## Details

The examples section shows how the DBF files from the book website for
Chapter 9 were converted into the `nydata` data frame and the `listw_NY`
spatial weights list. The `shapes` directory includes the original
version of the UTM18 census tract boundaries imported from BNA format
(http://sedac.ciesin.columbia.edu/ftpsite/pub/census/usa/tiger/ny/bna_st/t8_36.zip)
before the OGR/GDAL BNA driver was available. The `NY8_utm18` shapefile
was constructed using a bna2mif converter and converted to shapefile
format after adding data using `writeOGR`. The new file
`NY8_bna_utm18.gpkg` has been constructed from the original BNA file,
but read using the OGR BNA driver with GEOS support. The NY8 shapefile
and GeoPackage NY8_utm18.gpkg include invalid polygons, but because the
OGR BNA driver may have GEOS support (used here), the tract polygon
objects in NY8_bna_utm18.gpkg are valid.

## References

Waller, L. and C. Gotway (2004) *Applied Spatial Statistics for Public
Health Data*. New York: John Wiley and Sons.

## Examples

``` r
## NY leukemia
# \donttest{
if (requireNamespace("sf", quietly = TRUE)) {
library(foreign)
nydata <- read.dbf(system.file("misc/nydata.dbf", package="spData")[1])
nydata <- sf::st_as_sf(nydata, coords=c("X", "Y"), remove=FALSE)
plot(sf::st_geometry(nydata))

nyadjmat <- as.matrix(read.dbf(system.file("misc/nyadjwts.dbf",
                                           package="spData")[1])[-1])
ID <- as.character(names(read.dbf(system.file("misc/nyadjwts.dbf",
                                              package="spData")[1]))[-1])
identical(substring(ID, 2, 10), substring(as.character(nydata$AREAKEY), 2, 10))

if (requireNamespace("sf", quietly = TRUE)) {
library(spdep)
listw_NY <- mat2listw(nyadjmat, as.character(nydata$AREAKEY), style="B")
}
}

#> Field name: ‘Z600701190’ changed to: ‘Z600701190.1’
#> Field name: ‘Z600701190’ changed to: ‘Z600701190.2’
#> Field name: ‘Z600701200’ changed to: ‘Z600701200.1’
#> Field name: ‘Z600701210’ changed to: ‘Z600701210.1’
#> Field name: ‘Z600701210’ changed to: ‘Z600701210.2’
#> Field name: ‘Z600701220’ changed to: ‘Z600701220.1’
#> Field name: ‘Z600701270’ changed to: ‘Z600701270.1’
#> Field name: ‘Z600701320’ changed to: ‘Z600701320.1’
#> Field name: ‘Z600701330’ changed to: ‘Z600701330.1’
#> Field name: ‘Z605303010’ changed to: ‘Z605303010.1’
#> Field name: ‘Z605303010’ changed to: ‘Z605303010.2’
#> Field name: ‘Z605303040’ changed to: ‘Z605303040.1’
#> Field name: ‘Z605303040’ changed to: ‘Z605303040.2’
#> Field name: ‘Z605303050’ changed to: ‘Z605303050.1’
#> Field name: ‘Z606700170’ changed to: ‘Z606700170.1’
#> Field name: ‘Z606700360’ changed to: ‘Z606700360.1’
#> Field name: ‘Z606700560’ changed to: ‘Z606700560.1’
#> Field name: ‘Z606700610’ changed to: ‘Z606700610.1’
#> Field name: ‘Z606700610’ changed to: ‘Z606700610.2’
#> Field name: ‘Z606701100’ changed to: ‘Z606701100.1’
#> Field name: ‘Z606701110’ changed to: ‘Z606701110.1’
#> Field name: ‘Z606701120’ changed to: ‘Z606701120.1’
#> Field name: ‘Z606701120’ changed to: ‘Z606701120.2’
#> Field name: ‘Z606701120’ changed to: ‘Z606701120.3’
#> Field name: ‘Z606701140’ changed to: ‘Z606701140.1’
#> Field name: ‘Z606701520’ changed to: ‘Z606701520.1’
#> Field name: ‘Z606701650’ changed to: ‘Z606701650.1’
#> Field name: ‘Z606701680’ changed to: ‘Z606701680.1’
#> Field name: ‘Z606701690’ changed to: ‘Z606701690.1’
#> Field name: ‘Z600701190’ changed to: ‘Z600701190.1’
#> Field name: ‘Z600701190’ changed to: ‘Z600701190.2’
#> Field name: ‘Z600701200’ changed to: ‘Z600701200.1’
#> Field name: ‘Z600701210’ changed to: ‘Z600701210.1’
#> Field name: ‘Z600701210’ changed to: ‘Z600701210.2’
#> Field name: ‘Z600701220’ changed to: ‘Z600701220.1’
#> Field name: ‘Z600701270’ changed to: ‘Z600701270.1’
#> Field name: ‘Z600701320’ changed to: ‘Z600701320.1’
#> Field name: ‘Z600701330’ changed to: ‘Z600701330.1’
#> Field name: ‘Z605303010’ changed to: ‘Z605303010.1’
#> Field name: ‘Z605303010’ changed to: ‘Z605303010.2’
#> Field name: ‘Z605303040’ changed to: ‘Z605303040.1’
#> Field name: ‘Z605303040’ changed to: ‘Z605303040.2’
#> Field name: ‘Z605303050’ changed to: ‘Z605303050.1’
#> Field name: ‘Z606700170’ changed to: ‘Z606700170.1’
#> Field name: ‘Z606700360’ changed to: ‘Z606700360.1’
#> Field name: ‘Z606700560’ changed to: ‘Z606700560.1’
#> Field name: ‘Z606700610’ changed to: ‘Z606700610.1’
#> Field name: ‘Z606700610’ changed to: ‘Z606700610.2’
#> Field name: ‘Z606701100’ changed to: ‘Z606701100.1’
#> Field name: ‘Z606701110’ changed to: ‘Z606701110.1’
#> Field name: ‘Z606701120’ changed to: ‘Z606701120.1’
#> Field name: ‘Z606701120’ changed to: ‘Z606701120.2’
#> Field name: ‘Z606701120’ changed to: ‘Z606701120.3’
#> Field name: ‘Z606701140’ changed to: ‘Z606701140.1’
#> Field name: ‘Z606701520’ changed to: ‘Z606701520.1’
#> Field name: ‘Z606701650’ changed to: ‘Z606701650.1’
#> Field name: ‘Z606701680’ changed to: ‘Z606701680.1’
#> Field name: ‘Z606701690’ changed to: ‘Z606701690.1’
# }
```
