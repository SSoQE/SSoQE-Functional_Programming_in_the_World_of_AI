#----------------------------------------------------------#
#
#
#                 Functional Project
#
#                   Estimate Diversity
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
data_vegetation_lowlands <-
  load_and_clean_csv("Data/Input/vegetation_lowlands.csv")

data_vegetation_highlands <-
  load_and_clean_csv("Data/Input/vegetation_highlands.csv")

# <Estimate diversity> ...
