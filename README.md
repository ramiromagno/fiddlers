
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fiddlers

<!-- badges: start -->
<!-- badges: end -->

`{fiddlers}` is an R data package providing a fictional data set about
fiddler crabs in the Algarve, Portugal.

This R data package provides simple demographics and a few morphometric
variables about three fictitious species of fiddler crabs.

It can be useful to teach marine biologists the fundamental principles
of data science, such as tidying and visualisation.

## Installation

You can install the development version of `{fiddlers}` like so:

``` r
# install.packages("remotes")
remotes::install_github("ramiromagno/fiddlers")
```

## Usage

This package provides two data sets: `fiddlers` and `quadrats`.

``` r
library(fiddlers)

fiddlers
#> # A tibble: 7,326 × 12
#>    species     region season quadrat sex   stage    cw    cl    fw hyper…¹   lcl
#>    <chr>       <chr>  <chr>  <chr>   <fct> <ord> <dbl> <dbl> <dbl> <fct>   <dbl>
#>  1 Afruca far… Ria F… summer q1      fema… juve…    27    21    15 none       16
#>  2 Afruca far… Ria F… summer q1      fema… juve…    27    21    16 none       13
#>  3 Afruca far… Ria F… summer q1      fema… juve…    19    15    10 none        9
#>  4 Afruca far… Ria F… summer q1      fema… juve…    26    21    19 none       16
#>  5 Afruca far… Ria F… summer q1      fema… juve…    24    19    14 none        8
#>  6 Afruca far… Ria F… summer q1      fema… juve…    22    17    15 none        7
#>  7 Afruca far… Ria F… summer q1      fema… juve…    25    19    15 none       14
#>  8 Afruca far… Ria F… summer q1      fema… juve…    18    14     8 none       13
#>  9 Afruca far… Ria F… summer q1      fema… juve…    24    19    11 none       10
#> 10 Afruca far… Ria F… summer q1      fema… juve…    24    19    19 none       12
#> # … with 7,316 more rows, 1 more variable: rcl <dbl>, and abbreviated variable
#> #   name ¹​hypertrophy
#> # ℹ Use `print(n = ...)` to see more rows, and `colnames()` to see all variable names
```

``` r
quadrats
#> # A tibble: 4 × 3
#>   region       quadrat  area
#>   <chr>        <chr>   <dbl>
#> 1 Ria Formosa  q1        250
#> 2 Ria Formosa  q2        360
#> 3 Ria de Alvor q1        260
#> 4 Ria de Alvor q2        220
```
