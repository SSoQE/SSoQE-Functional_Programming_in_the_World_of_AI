download_pollen_data <- function(sel_polygon) {
  `%>%` <- magrittr::`%>%`

  data_pollen_datatasets <-
    neotoma2::get_datasets(
      loc = sel_polygon,
      datasettype = "pollen",
      all_data = TRUE
    )

  # get downloads
  # this will take a while
  data_pollen_downloads <-
    neotoma2::get_downloads(data_pollen_datatasets)

  return(data_pollen_downloads)
}
