#' Calculate the mean of a penguin measurement
#'
#' @param x A non-empty numeric vector.
#' @param na_rm A single logical value. When `TRUE`, missing values are ignored.
#'
#' @return One finite numeric mean.
#'
#' @examples
#' mean_penguin_measurement(c(35, 45, 55))
mean_penguin_measurement <- function(x, na_rm = FALSE) {
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

  result <- mean(x, na.rm = na_rm)

  return(result)
}
