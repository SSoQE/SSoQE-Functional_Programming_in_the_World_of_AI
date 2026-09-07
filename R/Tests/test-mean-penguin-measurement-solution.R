source(
  here::here(
    "R/Exercises/Solutions/mean_penguin_measurement.R"
  ),
  local = TRUE
)

testthat::test_that("penguin measurement means are calculated", {
  testthat::expect_equal(
    mean_penguin_measurement(c(35, 45, 55)),
    45
  )
  testthat::expect_equal(
    mean_penguin_measurement(c(35, NA, 55), na_rm = TRUE),
    45
  )
})

testthat::test_that("unsupported measurement inputs fail clearly", {
  testthat::expect_error(
    mean_penguin_measurement("long"),
    "numeric vector",
    fixed = TRUE
  )
  testthat::expect_error(
    mean_penguin_measurement(numeric()),
    "must not be empty",
    fixed = TRUE
  )
  testthat::expect_error(
    mean_penguin_measurement(c(35, NA, 55)),
    "contains missing values",
    fixed = TRUE
  )
  testthat::expect_error(
    mean_penguin_measurement(c(35, Inf)),
    "only finite values",
    fixed = TRUE
  )
  testthat::expect_error(
    mean_penguin_measurement(c(NA_real_, NA_real_), na_rm = TRUE),
    "at least one non-missing value",
    fixed = TRUE
  )
})
