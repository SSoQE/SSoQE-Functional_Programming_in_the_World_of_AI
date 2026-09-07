#----------------------------------------------------------#
#
#                 Defensive programming
#
#                  Completed Task 4
#
#----------------------------------------------------------#

source(
  here::here(
    "R/Exercises/Solutions/mean_penguin_measurement.R"
  )
)

testthat::test_that("penguin means are calculated", {
  testthat::expect_equal(
    mean_penguin_measurement(c(35, 45, 55)),
    45
  )
})

testthat::test_that("text is rejected", {
  testthat::expect_error(
    mean_penguin_measurement("long"),
    "numeric vector",
    fixed = TRUE
  )
})
