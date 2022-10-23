create_demographics_individuals <- function(demographics_tally) {

  tbl <- tibble::tibble(
    sex = rep(demographics_tally$sex, times = demographics_tally$counts),
    stage = rep(demographics_tally$stage, times = demographics_tally$counts)
  )

  return(tbl)
}

demographics <- function(file) {
  # `lst`: list representation of the YAML contents
  lst <- read_yaml(file)

  # `n`: number of individuals
  n <- parse_n(lst)

  # `table`: contingency table of proportions for sex and stage demographics
  table <- parse_demographics(lst = lst)

  # `tally`: absolute counts of sex and stage demographics (`counts` column)
  tally <- add_counts_to_demographics(table, n)

  # individuals
  individuals <- create_demographics_individuals(tally)

  return(individuals)
}
