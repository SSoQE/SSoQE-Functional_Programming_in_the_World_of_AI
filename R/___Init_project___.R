# Prepare the project environment. Run this script only during setup or
# deliberate dependency maintenance, never during rendering.

if (isFALSE(requireNamespace("renv", quietly = TRUE))) {
  utils::install.packages("renv")
}

renv::activate()
renv::restore(
  lockfile = "renv.lock",
  prompt = FALSE
)

required_packages <-
  c(
    "assertthat",
    "countdown",
    "dplyr",
    "fs",
    "ggplot2",
    "here",
    "jsonlite",
    "knitr",
    "palmerpenguins",
    "purrr",
    "quarto",
    "renv",
    "testthat",
    "usethis"
  )

missing_packages <-
  required_packages[
    !vapply(
      required_packages,
      requireNamespace,
      logical(1),
      quietly = TRUE
    )
  ]

if (length(missing_packages) > 0L) {
  renv::install(missing_packages)
}

if (isFALSE(requireNamespace("usethis", quietly = TRUE))) {
  stop("The project setup requires the usethis package.")
}

renv::snapshot(
  lockfile = "renv.lock",
  prompt = FALSE
)
