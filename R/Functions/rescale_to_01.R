#' Rescale a numeric vector to the unit interval
#'
#' @param x A numeric vector containing at least two distinct finite values.
#' @param na_rm A single logical value. When `TRUE`, missing values are ignored
#'   when estimating the range and retained in their original positions.
#'
#' @return A numeric vector with the same length as `x`. Finite non-missing
#'   values are rescaled to the interval from zero to one.
#'
#' @examples
#' rescale_to_01(c(-10, 0, 10))
rescale_to_01 <- function(x, na_rm = FALSE) {
  assertthat::assert_that(
    is.numeric(x),
    msg = "`x` must be a numeric vector."
  )
  assertthat::assert_that(
    is.null(dim(x)),
    msg = "`x` must be a vector, not a matrix or array."
  )
  assertthat::assert_that(
    assertthat::is.flag(na_rm),
    msg = "`na_rm` must be either TRUE or FALSE."
  )
  assertthat::assert_that(
    length(x) > 0L,
    msg = "`x` must not be empty."
  )
  assertthat::assert_that(
    !any(is.nan(x)),
    msg = "`x` must contain only finite values."
  )

  if (isFALSE(na_rm)) {
    assertthat::assert_that(
      !anyNA(x),
      msg = "`x` contains missing values; use `na_rm = TRUE` to ignore them."
    )
  }

  observed_x <- x[!is.na(x)]

  assertthat::assert_that(
    length(observed_x) > 0L,
    msg = "`x` must contain at least one non-missing value."
  )
  assertthat::assert_that(
    all(is.finite(observed_x)),
    msg = "`x` must contain only finite values."
  )
  assertthat::assert_that(
    length(unique(observed_x)) > 1L,
    msg = "`x` must contain at least two distinct values."
  )

  x_range <- range(observed_x)

  (x - x_range[[1]]) / diff(x_range)
}
