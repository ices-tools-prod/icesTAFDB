
[![Build
Status](https://travis-ci.org/ices-tools-prod/icesTAFDB.svg?branch=devel)](https://travis-ci.org/ices-tools-prod/icesTAFDB)
[![CRAN
Status](http://r-pkg.org/badges/version/icesTAFDB)](https://cran.r-project.org/package=icesTAFDB)
[![CRAN
Monthly](http://cranlogs.r-pkg.org/badges/icesTAFDB)](https://cran.r-project.org/package=icesTAFDB)
[![CRAN
Total](http://cranlogs.r-pkg.org/badges/grand-total/icesTAFDB)](https://cran.r-project.org/package=icesTAFDB)

[<img align="right" alt="ICES Logo" width="17%" height="17%" src="http://ices.dk/_layouts/15/1033/images/icesimg/iceslogo.png">](http://ices.dk)

``` r
library(knitr)
library(icesTAFDB)
```

# icesTAFDB

icesTAFDB Functions to support the creation of ICES Fisheries Overviews,
….

icesTAFDB is implemented as an [R](https://www.r-project.org) package
<!-- and available on [CRAN](https://cran.r-project.org/package=icesTAFDB). -->
and available on GitHub

## Installation

icesTAFDB can be installed from <https://ices-tools-prod.r-universe.dev>
using `install.packages`:

``` r
install.packages("icesTAFDB", repos = c('https://ices-tools-prod.r-universe.dev', 'https://cloud.r-project.org'))
```

## Usage

For a summary of the package:

``` r
library(icesTAFDB)
?icesTAFDB
```

## Examples

## Test your connection to the DB

To test that you have the package set up correctly and have registered
with ICES TAF, run `test()`

``` r
test()
```

    ## GETing ... https://adminweb06.ices.dk/api/whoami

    ## using user supplied token for user ICES\colin

    ## OK (HTTP 200).

    ## it works colin!
    ##  Your Claims are:
    ##    * user: admin

in the case you have not registered, you will get the following message

``` r
test(use_token = FALSE)
```

    ## GETing ... https://adminweb06.ices.dk/api/whoami

    ## no token used

    ## OK (HTTP 200).

    ## Could not find you! Please go to:  https://taf.ices.dk/github/  and follow the instructions to connect your github account.

# to build this github_document

``` r
rmarkdown::render("README.Rmd")
```
