#----------------------------------------------------------#
#
#       Functional programming with Palmer Penguins
#
#                 Participant script
#
#----------------------------------------------------------#

# Work through Tasks 1 and 2 in pairs or individually.
# The completed script is R/Exercises/Solutions/01_functionals.R.


#----------------------------------------------------------#
# Task 1: create the function, 4 minutes ----
#----------------------------------------------------------#

# Run this in the console. It creates and opens the file used in later tasks.
# usethis::edit_file("R/Functions/mean_penguin_measurement.R")

# In that file, write:
# mean_penguin_measurement <- function(x, na_rm = FALSE) {
#   [write your code here]
# }

# Contract: one numeric vector in; one numeric mean out.


#----------------------------------------------------------#
# Task 2: map across penguin measurements, 4 minutes ----
#----------------------------------------------------------#

penguin_measurements <-
  palmerpenguins::penguins |>
  dplyr::select(
    bill_length_mm,
    bill_depth_mm,
    flipper_length_mm,
    body_mass_g
  )

# Source the function file you created.
# source(here::here("R/Functions/mean_penguin_measurement.R"))

measurement_means <-
  purrr::map_dbl(
    .x = penguin_measurements,
    .f = ~ {
      # [Call the function here.]
    }
  )

# Print the named numeric vector when you finish.
measurement_means
