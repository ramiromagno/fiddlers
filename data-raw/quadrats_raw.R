## code to prepare `quadrats_raw` dataset goes here

library(tidyverse)

quadrats_raw <- readxl::read_xlsx(here::here("data-raw/quadrats.xlsx"))

quadrats01 <- select(quadrats_raw, -1)

quadrats02 <-
  quadrats01 |>
  pivot_longer(cols = everything(), names_sep = "-", names_to = c("region", "quadrat"), values_to = "area")

quadrats <- quadrats02

usethis::use_data(quadrats, overwrite = TRUE)
# usethis::use_data(quadrats_raw, overwrite = TRUE)
