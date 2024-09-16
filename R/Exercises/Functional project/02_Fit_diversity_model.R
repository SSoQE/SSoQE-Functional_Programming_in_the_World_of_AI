#----------------------------------------------------------#
#
#
#                 Functional Project
#
#                 Fit Diversity Model
#
#
#                       O. Mottl
#                         2024
#
#----------------------------------------------------------#

# define helper function
load_and_clean_csv <- function(file_name) {
  file_name %>%
    readr::read_csv(file = .) %>%
    janitor::clean_names() %>%
    return()
}

# load data
data_diversity_lowlands <-
  load_and_clean_csv("Data/Processed/diversity_lowlands.csv")

data_diversity_highlands <-
  load_and_clean_csv("Data/Processed/diversity_highlands.csv")

# <Fit models> ...
