library(fiddlers)
library(here)
library(tidyverse)
library(ggplot2)

set.seed(42)

# Ria Formosa
# Species: Afruca farensis
af_rf_s_q1 <- crab_sample(file = here::here("inst/samples/af_rf_s_q1.yml"))
af_rf_s_q2 <- crab_sample(file = here::here("inst/samples/af_rf_s_q2.yml"))
af_rf_w_q1 <- crab_sample(file = here::here("inst/samples/af_rf_w_q1.yml"))
af_rf_w_q2 <- crab_sample(file = here::here("inst/samples/af_rf_w_q2.yml"))

# Species: Uca olhanensis
uo_rf_s_q1 <- crab_sample(file = here::here("inst/samples/uo_rf_s_q1.yml"))
uo_rf_s_q2 <- crab_sample(file = here::here("inst/samples/uo_rf_s_q2.yml"))
uo_rf_w_q1 <- crab_sample(file = here::here("inst/samples/uo_rf_w_q1.yml"))
uo_rf_w_q2 <- crab_sample(file = here::here("inst/samples/uo_rf_w_q2.yml"))

# Ria de Alvor
# Species: Afruca farensis
af_ra_s_q1 <- crab_sample(file = here::here("inst/samples/af_ra_s_q1.yml"))
af_ra_s_q2 <- crab_sample(file = here::here("inst/samples/af_ra_s_q2.yml"))
af_ra_w_q1 <- crab_sample(file = here::here("inst/samples/af_ra_w_q1.yml"))
af_ra_w_q2 <- crab_sample(file = here::here("inst/samples/af_ra_w_q2.yml"))

# Species: Uca olhanensis
uo_ra_s_q1 <- crab_sample(file = here::here("inst/samples/uo_ra_s_q1.yml"))
uo_ra_s_q2 <- crab_sample(file = here::here("inst/samples/uo_ra_s_q2.yml"))
uo_ra_w_q1 <- crab_sample(file = here::here("inst/samples/uo_ra_w_q1.yml"))
uo_ra_w_q2 <- crab_sample(file = here::here("inst/samples/uo_ra_w_q2.yml"))

# Species: Ucides alvorensis
ua_ra_s_q1 <- crab_sample(file = here::here("inst/samples/ua_ra_s_q1.yml"))
ua_ra_s_q2 <- crab_sample(file = here::here("inst/samples/ua_ra_s_q2.yml"))
ua_ra_w_q1 <- crab_sample(file = here::here("inst/samples/ua_ra_w_q1.yml"))
ua_ra_w_q2 <- crab_sample(file = here::here("inst/samples/ua_ra_w_q2.yml"))


fiddlers <-
  dplyr::bind_rows(
    af_rf_s_q1,
    af_rf_s_q2,
    af_rf_w_q1,
    af_rf_w_q2,
    uo_rf_s_q1,
    uo_rf_s_q2,
    uo_rf_w_q1,
    uo_rf_w_q2,
    af_ra_s_q1,
    af_ra_s_q2,
    af_ra_w_q1,
    af_ra_w_q2,
    uo_ra_s_q1,
    uo_ra_s_q2,
    uo_ra_w_q1,
    uo_ra_w_q2,
    ua_ra_s_q1,
    ua_ra_s_q2,
    ua_ra_w_q1,
    ua_ra_w_q2
  ) |>
  tidyr::separate(
    col = "experiment",
    into = c("region", "season", "quadrat"),
    sep = "-"
  )

usethis::use_data(fiddlers, compress = "xz", overwrite = TRUE)
