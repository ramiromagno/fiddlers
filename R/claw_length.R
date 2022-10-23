claw_length <- function(cw, hypertrophy, k0 = 0.3, k1 = 2, kmin = 0.1) {
  # k0: scaling factor when claw is not hypertrophied
  # k1: scaling factor when claw is hypertrophied

  vec <- vctrs::vec_recycle_common(cw, hypertrophy)
  cw <- vec[[1]]
  hypertrophy <- vec[[2]]

  n <- length(cw)
  left_small_claw <- cw*kmin + stats::rpois(n, cw * k0)
  right_small_claw <- cw*kmin + stats::rpois(n, cw * k0)
  left_big_claw <- cw*kmin + stats::rpois(n, cw * k1)
  right_big_claw <- cw*kmin + stats::rpois(n, cw * k1)

  left_claw_k <- dplyr::case_when(
    hypertrophy == "none" ~ left_small_claw,
    hypertrophy == "left" ~ left_big_claw,
    hypertrophy == "right" ~ left_small_claw,
    hypertrophy == "both" ~ left_big_claw,
  )

  right_claw_k <- dplyr::case_when(
    hypertrophy == "none" ~ right_small_claw,
    hypertrophy == "left" ~ right_small_claw,
    hypertrophy == "right" ~ right_big_claw,
    hypertrophy == "both" ~ right_big_claw
  )

  # lcl: left claw length
  # rcl: right claw length
  tibble::tibble(lcl = left_claw_k, rcl = right_claw_k)
}
