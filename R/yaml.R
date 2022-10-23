read_yaml <- function(file) {

  # Because of https://github.com/vubiostat/r-yaml/issues/122
  # boolean_handler <- function(x) {
  #   if(x %in% c('n','y')) x else tolower(x)=='true'
  # }

  # lst <- yaml.load_file(input = file, handlers = list(boolean = boolean_handler))
  lst <- yaml::yaml.load_file(input = file)

  return(lst)
}

parse_n <- function(lst) {
  lst$n
}

parse_demographics <- function(lst) {
  tbl <- dplyr::bind_rows(lst$demographics)
  return(tbl)
}

#' @importFrom rlang .data
add_counts_to_demographics <- function(tbl, n) {

  total_prob <- sum(tbl$prob)
  counts <- as.integer(n * tbl$prob / total_prob)
  tbl2 <- dplyr::mutate(tbl, counts = counts)

  return(tbl2)
}

#' @importFrom rlang .data
parse_handedness <- function(lst) {

  dplyr::bind_rows(lst$handedness) |>
    dplyr::group_by(.data$sex, .data$stage) |>
    dplyr::summarise(side = list(.data$side)) |>
    dplyr::mutate(side = purrr::modify_depth(.data$side, 1L, unlist)) |>
    dplyr::ungroup()

}

#' Generate a sample of crabs
#'
#' Takes a configuration (YAML) file as input and generates a sample of fiddler
#' crabs according to the specification in file.
#'
#' @param file A YAML file, see examples in `inst/samples`.
#'
#' @return A [tibble][tibble::tibble-package] of fiddler crabs.
#' @importFrom rlang .data
#' @export
crab_sample <- function(file) {

  lst <- read_yaml(file)
  demographics <- demographics(file)
  species <- lst$species
  carapace_width <- lst$cw

  tbl <-
    tibble::tibble(
      species = lst$species,
      experiment = lst$experiment,
      demographics
    )

  # Carapace width
  cw <-
    cw(
      tbl$sex,
      tbl$stage,
      cw_ref = lst$cw,
      sex_rel_size = c(
        juvenile = stats::runif(
          1L,
          min = lst$size$sex$juvenile$min,
          max = lst$size$sex$juvenile$max
        ),
        pre_puberty = stats::runif(
          1L,
          min = lst$size$sex$pre_puberty$min,
          max = lst$size$sex$pre_puberty$max
        ),
        sub_adult = stats::runif(
          1L,
          min = lst$size$sex$sub_adult$min,
          max = lst$size$sex$sub_adult$max
        ),
        adult = stats::runif(
          1L,
          min = lst$size$sex$adult$min,
          max = lst$size$sex$adult$max
        )
      ),
      stage_rel_size = purrr::modify_depth(lst$size$stage, .depth = 1L, unlist)
    )

  # Carapace length
  cl <- cl(cw, k = lst$cl$k, ksd = lst$cl$ksd)

  # Front width
  fw = fw(cw, front_type = lst$fw)

  handedness <- parse_handedness(lst)
  sides <- c('none', 'left', 'right', 'both')

  handedness_tbl <-
    dplyr::left_join(tbl,
                     handedness,
                     by = c("sex", "stage")) |>
    dplyr::rowwise() |>
    dplyr::mutate(hypertrophy = sample(sides, 1L, prob = .data$side)) |>
    dplyr::ungroup()

  claw_lengths <- claw_length(
    cw = cw,
    hypertrophy = handedness_tbl[['hypertrophy']],
    k0 = lst$claw_length$k0,
    k1 = lst$claw_length$k1,
    kmin = lst$claw_length$kmin
  )

  tbl <- dplyr::bind_cols(
    tbl,
    cw = cw,
    cl = cl,
    fw = fw,
    handedness_tbl['hypertrophy'],
    claw_lengths
    )

  tbl <- dplyr::mutate(tbl, dplyr::across(tidyselect::where(is.double), round))

  tbl <- dplyr::mutate(
    tbl,
    sex = factor(.data$sex, levels = c("female", "male")),
    stage = factor(.data$stage, levels = c("juvenile", "pre_puberty", "sub_adult", "adult"), ordered = TRUE),
    hypertrophy = factor(.data$hypertrophy, levels = sides)
  )

  return(tbl)
}
