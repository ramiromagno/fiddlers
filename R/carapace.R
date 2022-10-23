cw <- function(
    sex,
    stage,
    cw_ref = 80, # max cw (in mm) of an adult male.
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
        pre_puberty = c(0.35, 0.50),
        sub_adult = c(0.50, 0.70),
        adult = c(0.70, 1)
      )
) {

  cw_ref * crab_size(sex, stage, sex_rel_size = sex_rel_size, stage_rel_size = stage_rel_size)

}

cl <- function(cw, k = 0.75, ksd = 0.01) {

  n <- length(cw)
  # carapace length deviation
  cl_dev <- stats::rlnorm(n = n, meanlog = 0, sdlog = log(cw)*ksd)

  # Linear mapping between carapace width and length
  cl <- cw * k + cl_dev

  return(cl)
}

fw <- function(cw, front_type = c("NF", "BF")) {

  n <- length(cw)
  front_type <- match.arg(front_type)
  # k <- ifelse("NF", 0.05, 0.3)

  if (front_type == "NF")
    k <- stats::runif(n, min = 0.15, max = 0.25)
  else
    k <- stats::runif(n, min = 0.20, max = 0.40)

  # front width
  fw <- cw * k + stats::rlnorm(n, log(cw*k), sdlog = 0.1)

  return(fw)
}
