# Repository-specific guidance

This is a template-derived lecture repository for Functional Programming in the World of AI.

- Use Palmer Penguins as the lesson-wide ecological example and exercise data.
- Keep reusable course functions under `R/Functions/`. Participant tests created with `{usethis}` use `tests/testthat/`; `R/run_tests.R` runs both maintained checks and participant tests in this non-package project.
- Tracked `_targets/` metadata in older commits is historical and is not part of the current lesson.
- Render through `R/render.R`, which synchronizes `Presentation/presentation.html` and `docs/index.html`.
