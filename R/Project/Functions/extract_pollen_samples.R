
extract_pollen_samples <- function(data_source) {
  `%>%` <- magrittr::`%>%`

  data_pollen_samples <-
    neotoma2::samples(data_source) %>%
    as.data.frame()  %>%
    tibble::as_tibble()

  return(data_pollen_samples)
}
