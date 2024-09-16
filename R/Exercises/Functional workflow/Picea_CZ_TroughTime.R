#----------------------------------------------------------#
#
#
#     Functional Programming (with fossil pollen data)
#
#              Picea presence in Czech Republic
#
#
#                       O. Mottl
#                         2024
#
#----------------------------------------------------------#

# Get data for a selected Picea in Czech Republic
#  by {neotoma2} package and plot its presence through time

# Hint: `variablename` is the name of the Taxon in `Samples` data frame


#----------------------------------------------------------#
# 0. Setup -----
#----------------------------------------------------------#

# load libraries
library(tidyverse) # general data wrangling and visualisation ✨
library(neotoma2) # # access to the Neotoma database 🌿
library(here) # for working directory 🗺️
library(janitor) # string cleaning 🧹
library(rjson) # JSON parser 📦

# source the config file
source(
  here::here("R/00_Confiq_file.R")
)


#----------------------------------------------------------#
# 1. Get data -----
#----------------------------------------------------------#

sel_polygon <-
  geojsonsf::geojson_sf(
    '
    {
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [
            [
              14.859930104624652,
              51.071592279839706
            ],
            [
              14.326185651484678,
              51.13142548725176
            ],
            [
              11.906196618037029,
              50.387610468133374
            ],
            [
              12.287440057644432,
              49.63651369192763
            ],
            [
              13.958117230189742,
              48.50055013574672
            ],
            [
              14.8601092375537,
              48.52606780450495
            ],
            [
              15.17762133977621,
              48.90294718287069
            ],
            [
              16.944330274262512,
              48.571502932179214
            ],
            [
              17.947537470045347,
              48.873577052026036
            ],
            [
              18.955551998389666,
              49.54181829616357
            ],
            [
              18.215150430835536,
              50.078981587009935
            ],
            [
              16.7216451856589,
              50.569772422798735
            ],
            [
              14.859930104624652,
              51.071592279839706
            ]
          ]
        ],
        "type": "Polygon"
      }
    }
  ]
}'
  )

# get datasets
# this will take a while
data_cz_datatasets <-
  neotoma2::get_datasets(
    loc = sel_polygon,
    datasettype = "pollen",
    ageof = 5e3,
    all_data = TRUE
  )

# get downloads
# this will take a while
data_cz_downloads <-
  neotoma2::get_downloads(data_cz_datatasets)

# get samples
data_cz_samples <-
  neotoma2::samples(data_cz_downloads) %>%
  as.data.frame() %>%
  tibble::as_tibble()

data_samples_length <-
  data_cz_samples %>%
  dplyr::distinct(long, lat, age)


#----------------------------------------------------------#
# 3. Filter to only have `Picea` -----
#----------------------------------------------------------#

picea_names <-
  data_cz_samples %>%
  dplyr::distinct(variablename) %>%
  janitor::clean_names() %>%
  dplyr::filter(
    stringr::str_detect(variablename, "Picea")
  ) %>%
  purrr::chuck("variablename")

print(picea_names)

data_cz_picea <-
  data_cz_samples %>%
  dplyr::filter(variablename %in% picea_names) %>%
  dplyr::distinct(long, lat, age) %>%
  dplyr::mutate(
    picea_present = TRUE
  )


#----------------------------------------------------------#
# 4. Plot results -----
#----------------------------------------------------------#

age_step <- 2.5e3

data_to_plot <-
  data_samples_length %>%
  dplyr::left_join(
    data_cz_picea,
    by = c("long", "lat", "age")
  ) %>%
  dplyr::mutate(
    picea_present = ifelse(is.na(picea_present), FALSE, TRUE)
  ) %>%
  tidyr::drop_na() %>%
  dplyr::filter(
    age <= 20e3 &
      age >= 0
  ) %>%
  dplyr::mutate(
    age_bin = floor(age / age_step) * age_step
  ) %>%
  dplyr::group_by(long, lat, age_bin) %>%
  dplyr::summarise(
    .groups = "drop",
    picea_present = any(picea_present)
  )

fig_picea <-
  data_to_plot %>%
  ggplot2::ggplot(
    mapping = ggplot2::aes(
      x = long,
      y = lat,
    )
  ) +
  ggplot2::coord_quickmap(
    xlim = c(12, 19),
    ylim = c(48.5, 51)
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
      colour = picea_present
    ),
    size = 3
  ) +
  ggplot2::labs(
    title = "Czech Republic: Picea presence through time (yr BP)",
    subtitle = "Points represent available data",
    x = "Longitude",
    y = "Latitude",
    colour = "Picea present",
    caption = "Data filtered between 0 and 20 kyr BP."
  ) +
  ggplot2::theme(
    legend.position = "top"
  ) +
  ggplot2::scale_colour_manual(
    values = c("red", "darkgreen"),
    labels = c("No", "Yes")
  )

plot(fig_picea)