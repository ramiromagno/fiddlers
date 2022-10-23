claw_handedness <- function(none = 10,
                            left = 0,
                            right = 0,
                            both = 0
) {
  n <- none + left + right + both
  stopifnot(n > 0, none >= 0, left >= 0, right >= 0, both >= 0)

  sample(x = c(
    rep("none", none),
    rep("left", left),
    rep("right", right),
    rep("both", both)
  ),
  size = n,
  replace = FALSE)


}
