#----------------------------------------------------------#
#
#
#     Functional Programming (with fossil pollen data)
#
#                   {target} Project
#
#
#                       O. Mottl
#                         2024
#
#----------------------------------------------------------#

#----------------------------------------------------------#
# 0. Packages -----
#----------------------------------------------------------#

suppressPackageStartupMessages({
  library(tidyverse)
  library(neotoma2)
  library(here)
  library(geojsonsf)
  library(janitor)
  library(rlang)
  library(maps)
})

suppressMessages(
  here::i_am("R/Project/pollen_target.R")
)

#----------------------------------------------------------#
# 1. Functions -----
#----------------------------------------------------------#

path_project_functions <-
  here::here("R/Project/Functions")

# get vector of general functions
fun_list <-
  list.files(
    path = path_project_functions,
    pattern = "*.R",
    recursive = TRUE
  )

# source them
if (
  length(fun_list) > 0
) {
  sapply(
    paste0(path_project_functions, "/", fun_list),
    source
  )
}

#----------------------------------------------------------#
# 2. target list -----
#----------------------------------------------------------#

list(
  targets::tar_target(
    name = "polygon_path",
    command = here::here("Data/Input/sel_polygon.JSON"),
    format = "file"
  ),
  targets::tar_target(
    name = "data_pollen",
    command = load_polygon(polygon_path) %>%
      download_pollen_data()
  ),
  targets::tar_target(
    name = "data_pollen_samples",
    command = extract_pollen_samples(data_pollen)
  ),
  targets::tar_target(
    name = "fig_distribution",
    command = plot_distribution_of_taxa(
      data_pollen_samples,
      sel_taxon = "Pinus"
    )
  ),
  targets::tar_target(
    name = "fig_distribution_file",
    command = ggplot2::ggsave(
      plot = fig_distribution,
      filename = here::here("Outputs/Figures/plot_distribution.png")
    ),
    format = "file"
  )
)
