crab_size <- function(
    sex,
    stage,
    sex_rel_size =
      c(
        juvenile = 1,
        pre_puberty = 1,
        sub_adult = 1,
        adult = 1
      ),
    stage_rel_size =
      list(
        juvenile = c(0.20, 0.35),
        pre_puberty = c(0.25, 0.55),
        sub_adult = c(0.45, 0.75),
        adult = c(0.65, 1)
      )
) {

  # Recycle
  vecs <- vctrs::vec_recycle_common(sex, stage)
  sex <- vecs[[1]]
  stage <- vecs[[2]]

  stage_rel_sizes <-
    purrr::map_dbl(.x = stage,
                   .f = ~ stats::runif(1L, min = stage_rel_size[[.x]][1], max = stage_rel_size[[.x]][2]))

  sex_rel_sizes <-
    purrr::map2_dbl(.x = stage, .y = sex, .f = ~ ifelse(.y == "female", 1, sex_rel_size[[.x]]))

  size <- stage_rel_sizes * sex_rel_sizes
  return(size)

}
