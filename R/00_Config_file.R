# Generate presentation theme files before Quarto renders the deck.
# This pre-render hook performs no installation or dependency restoration.

here::i_am("R/00_Config_file.R")

source(
  here::here("R/generate_theme.R"),
  local = globalenv()
)
