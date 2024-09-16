plot_distribution_of_taxa <- function(data_source, sel_taxon, age_step = 2.5e3) {
  `.data` <- rlang::.data
  `%>%` <- magrittr::`%>%`

  long_lim <-
    data_source %>%
    dplyr::select("long") %>%
    dplyr::pull() %>%
    range()

  lat_lim <-
    data_source %>%
    dplyr::select("lat") %>%
    dplyr::pull() %>%
    range()

  taxon_names <-
    data_source %>%
    dplyr::distinct(.data$variablename) %>%
    janitor::clean_names() %>%
    dplyr::filter(
      stringr::str_detect(.data$variablename, sel_taxon)
    ) %>%
    purrr::chuck("variablename")

  data_taxon_filtered <-
    data_source %>%
    dplyr::filter(.data$variablename %in% taxon_names) %>%
    dplyr::distinct(.data$long, .data$lat, .data$age) %>%
    dplyr::mutate(
      taxon_present = TRUE
    )

  data_samples_length <-
    data_source %>%
    dplyr::distinct(.data$long, .data$lat, .data$age)

  data_to_plot <-
    data_samples_length %>%
    dplyr::left_join(
      data_taxon_filtered,
      by = c("long", "lat", "age")
    ) %>%
    dplyr::mutate(
      taxon_present = ifelse(is.na(.data$taxon_present), FALSE, TRUE)
    ) %>%
    tidyr::drop_na() %>%
    dplyr::filter(
      .data$age <= 20e3 &
        .data$age >= 0
    ) %>%
    dplyr::mutate(
      age_bin = floor(.data$age / age_step) * age_step
    ) %>%
    dplyr::group_by(.data$long, .data$lat, .data$age_bin) %>%
    dplyr::summarise(
      .groups = "drop",
      taxon_present = any(.data$taxon_present)
    )

  fig_res <-
    data_to_plot %>%
    ggplot2::ggplot(
      mapping = ggplot2::aes(
        x = long,
        y = lat,
      )
    ) +
    ggplot2::coord_quickmap(
      xlim = long_lim + c(-2, 2),
      ylim = lat_lim + c(-2, 2)
    ) +
    ggplot2::facet_wrap(
      ~age_bin
    ) +
    ggplot2::borders(
      fill = NA,
      colour = "grey20"
    ) +
    ggplot2::geom_point(
      mapping = ggplot2::aes(
        colour = taxon_present
      ),
      size = 3
    ) +
    ggplot2::labs(
      subtitle = "Points represent available data",
      x = "Longitude",
      y = "Latitude",
      colour = paste(sel_taxon, "present"),
      caption = "Data filtered between 0 and 20 kyr BP."
    ) +
    ggplot2::theme(
      legend.position = "top"
    ) +
    ggplot2::scale_colour_manual(
      values = c("red", "darkgreen"),
      labels = c("No", "Yes")
    )

  return(fig_res)
}
