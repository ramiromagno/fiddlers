stage <-
  function(n = 10,
           juvenile = as.integer(0.1 * n),
           pre_puberty = as.integer(0.1 * n),
           sub_adult = as.integer(0.3 * n),
           adult = n - (juvenile + pre_puberty + sub_adult)) {

    n <- juvenile + pre_puberty + sub_adult + adult
    stopifnot(n > 0, juvenile >= 0, pre_puberty >= 0, sub_adult >= 0, adult >= 0)

    sample(x = c(
      rep("juvenile", juvenile),
      rep("pre_puberty", pre_puberty),
      rep("sub_adult", sub_adult),
      rep("adult", adult)
    ),
    size = n,
    replace = FALSE)
}
