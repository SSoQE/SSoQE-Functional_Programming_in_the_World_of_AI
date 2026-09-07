#----------------------------------------------------------#
#
#       Functional programming with Palmer Penguins
#
#             Completed Tasks 1 and 2
#
#----------------------------------------------------------#

source(
  here::here(
    "R/Exercises/Solutions/mean_penguin_measurement.R"
  )
)

penguin_measurements <-
  palmerpenguins::penguins |>
  dplyr::select(
    bill_length_mm,
    bill_depth_mm,
    flipper_length_mm,
    body_mass_g
  )

measurement_means <-
  purrr::map_dbl(
    .x = penguin_measurements,
    .f = ~ mean_penguin_measurement(
      .x,
      na_rm = TRUE
    )
  )

measurement_means
