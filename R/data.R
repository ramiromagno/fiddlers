#' Fiddler crabs data set
#'
#' This is a fictitious data set of `r nrow(fiddlers)` crabs.
#'
#' @format
#' A tibble of `r ncol(fiddlers)` columns:
#' \describe{
#' \item{`species`}{Crab species name.}
#' \item{`region`}{Region in the Algarve, Portugal, where the crabs have been sampled.}
#' \item{`season`}{Season: either `"summer"` or `"winter"`.}
#' \item{`quadrat`}{Quadrat identifier.}
#' \item{`sex`}{Crab sex.}
#' \item{`stage`}{Developmental stage: `"juvenile"`, `"pre_puberty"`, `"sub_adult"` or `"adult"`.}
#' \item{`cw`}{Carapace width (in millimetres).}
#' \item{`cl`}{Carapace length (in millimetres).}
#' \item{`fw`}{Front width (in millimetres): section of the carapace in between the eyestalks.}
#' \item{`hypertrophy`}{Side of claw hypertrophy: either `"none"`, `"left"`, `"right"` or `"both"`.}
#' \item{`lcl`}{Left claw length (in millimetres).}
#' \item{`rcl`}{Right claw length (in millimetres).}
#' }
#'
"fiddlers"

#' A data set of quadrats
#'
#' This is a data set of the areas (in squared metres) of the quadrats used for
#' sampling the crabs that comprise the `fiddlers` data set. This is a
#' fictitious data set.
#'
#' @format
#' A tibble of `r ncol(quadrats)` columns:
#' \describe{
#' \item{`region`}{Region in the Algarve, Portugal, where the crabs have been sampled.}
#' \item{`quadrat`}{Quadrat identifier. A quadrat refers to the location and area where the sampling of crabs took place.}
#' \item{`area`}{Quadrat area in squared metres.}
#' }
#'
"quadrats"
