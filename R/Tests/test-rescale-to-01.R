source(
  here::here("R/Functions/rescale_to_01.R"),
  local = TRUE
)

testthat::test_that("values are rescaled to the unit interval", {
  testthat::expect_equal(
    rescale_to_01(c(-10, 0, 10)),
    c(0, 0.5, 1)
  )
})

testthat::test_that("missing positions are preserved when requested", {
  testthat::expect_equal(
    rescale_to_01(c(0, NA, 10), na_rm = TRUE),
    c(0, NA, 1)
  )
})

testthat::test_that("unsupported inputs fail with useful messages", {
  testthat::expect_error(
    rescale_to_01("ten"),
    "numeric vector",
    fixed = TRUE
  )
  testthat::expect_error(
    rescale_to_01(numeric()),
    "must not be empty",
    fixed = TRUE
  )
  testthat::expect_error(
    rescale_to_01(c(1, NA, 2)),
    "contains missing values",
    fixed = TRUE
  )
  testthat::expect_error(
    rescale_to_01(c(1, 1)),
    "two distinct values",
    fixed = TRUE
  )
  testthat::expect_error(
    rescale_to_01(c(1, Inf)),
    "only finite values",
    fixed = TRUE
  )
  testthat::expect_error(
    rescale_to_01(1:3, na_rm = 1),
    "either TRUE or FALSE",
    fixed = TRUE
  )
  testthat::expect_error(
    rescale_to_01(matrix(1:4, nrow = 2)),
    "not a matrix or array",
    fixed = TRUE
  )
  testthat::expect_error(
    rescale_to_01(c(0, NaN, 1), na_rm = TRUE),
    "only finite values",
    fixed = TRUE
  )
})
