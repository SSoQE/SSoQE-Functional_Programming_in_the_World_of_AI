#----------------------------------------------------------#
#
#                 Defensive programming
#
#                  Completed Task 3
#
#----------------------------------------------------------#

source(
  here::here(
    "R/Exercises/Solutions/mean_penguin_measurement.R"
  )
)

unsupported_message <-
  tryCatch(
    mean_penguin_measurement("bill"),
    error = conditionMessage
  )

unsupported_message
