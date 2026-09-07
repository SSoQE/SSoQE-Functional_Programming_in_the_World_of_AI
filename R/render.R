# Render the presentation and synchronize its publication copies.

presentation_source <-
  here::here("Presentation/presentation.qmd")

quarto::quarto_render(
  input = presentation_source,
  quiet = FALSE
)

rendered_file <-
  here::here("Presentation/index.html")

if (isFALSE(fs::file_exists(rendered_file))) {
  stop("Quarto did not create Presentation/index.html.")
}

fs::file_copy(
  path = rendered_file,
  new_path = here::here("Presentation/presentation.html"),
  overwrite = TRUE
)

fs::file_copy(
  path = rendered_file,
  new_path = here::here("docs/index.html"),
  overwrite = TRUE
)

fs::file_delete(rendered_file)
