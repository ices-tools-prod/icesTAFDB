
[![Build
Status](https://travis-ci.org/ices-tools-prod/icesTAFWeb.svg?branch=devel)](https://travis-ci.org/ices-tools-prod/icesTAFWeb)
[![CRAN
Status](http://r-pkg.org/badges/version/icesTAFWeb)](https://cran.r-project.org/package=icesTAFWeb)
[![CRAN
Monthly](http://cranlogs.r-pkg.org/badges/icesTAFWeb)](https://cran.r-project.org/package=icesTAFWeb)
[![CRAN
Total](http://cranlogs.r-pkg.org/badges/grand-total/icesTAFWeb)](https://cran.r-project.org/package=icesTAFWeb)

[<img align="right" alt="ICES Logo" width="17%" height="17%" src="http://ices.dk/_layouts/15/1033/images/icesimg/iceslogo.png">](http://ices.dk)

``` r
library(knitr)
library(icesTAFWeb)
```

# icesTAFWeb

icesTAFWeb Functions to support the creation of ICES Fisheries
Overviews, ….

icesTAFWeb is implemented as an [R](https://www.r-project.org) package
<!-- and available on [CRAN](https://cran.r-project.org/package=icesTAFWeb). -->
and available on GitHub

## Installation

icesTAFWeb can be installed from GitHub using the `install_github`
command from the `remotes` package:

``` r
library(remotes)
install_github("ices-tools-prod/icesTAFWeb")
```

## Usage

For a summary of the package:

``` r
library(icesTAFWeb)
?icesTAFWeb
```

## Examples

## Download a list of public TAF assessments

To get a list of all the publicly available assessments on TAF use the
function `taf_assessments()`

``` r
public_taf <- taf_assessments()
```

    ## GETing ... https://taf.ices.dk/assessments

``` r
# show a subset
kable(head(public_taf)[c(1,10,17,20,22,9)])
```

| name           | html\_url                                   | activeYear | expertGroup | dataCategory | run\_status |
| :------------- | :------------------------------------------ | ---------: | :---------- | :----------- | ----------: |
| 2015\_rjm-347d | <https://github.com/ices-taf/2015_rjm-347d> |       2015 | WGEF        | 3.2          |           1 |
| 2015\_had-iceg | <https://github.com/ices-taf/2015_had-iceg> |       2015 | NWWG        | 1            |           1 |
| 2016\_cod-347d | <https://github.com/ices-taf/2016_cod-347d> |       2016 | WGNSSK      | 1            |           1 |
| 2016\_ple-eche | <https://github.com/ices-taf/2016_ple-eche> |       2016 | WGNSSK      | 1            |           1 |

if you want to get the list of assessments / analyses available for a
particular stock in a given year, use

``` r
rjm2015 <- taf_assessments(year = 2015, stock = "rjm-347d")
```

    ## GETing ... https://taf.ices.dk/assessments/2015/rjm-347d

``` r
# show a subset
kable(head(rjm2015)[c(1,10,17,20,22,9)])
```

| id | run\_status | tafType    | stockDatabaseID | stockKeyLabel.1 | default\_branch |
| -: | ----------: | :--------- | --------------: | :-------------- | :-------------- |
| 38 |           1 | assessment |             658 | rjm-347d        | taf             |
