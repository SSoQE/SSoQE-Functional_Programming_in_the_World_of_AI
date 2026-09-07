# Run the unit tests for this non-package project from a fresh R session.

test_directories <-
  c(
    here::here("tests/testthat"),
    here::here("R/Tests")
  )

existing_test_directories <-
  test_directories[fs::dir_exists(test_directories)]

invisible(
  lapply(
    existing_test_directories,
    function(test_directory) {
      testthat::test_dir(
        path = test_directory,
        env = new.env(parent = globalenv()),
        load_package = "none",
        reporter = "summary"
      )
    }
  )
)
