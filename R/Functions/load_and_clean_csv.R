load_and_clean_csv <- function(file_name) {
  file_name %>%
    readr::read_csv(file = .) %>%
    janitor::clean_names() %>%
    return()
}
