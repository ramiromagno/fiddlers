sex <- function(n = 10, males = as.integer(n / 2), females = n - males) {

  n <- males + females
  stopifnot(n > 0, males >= 0, females >= 0)

  sample(x = c(rep("female", females), rep("male", males)), size = n, replace = FALSE)

}

