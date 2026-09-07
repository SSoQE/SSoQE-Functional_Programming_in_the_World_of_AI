<div align="center">

<img src="https://ssoqe.github.io/SSoQE_website/photos/SSOQE_logo3.png" width="150" alt="SSoQE logo">

# Functional Programming in the World of AI

**SSoQE 2026 · Wednesday, 16 September · 09:00–10:30**

[SSoQE website](https://ssoqe.github.io/SSoQE_website/) · [2026 programme](https://ssoqe.github.io/SSoQE_website/About/program.html)

</div>

## About the lesson

This 90-minute lesson teaches functions, arguments, DRY, functionals, and `{purrr}` through Palmer Penguins. Participants create one reusable penguin-measurement function, map it across numeric columns, protect its input contract with `{assertthat}`, and create a paired test with `{usethis}` and `{testthat}`.

The final segment connects these controls to AI-assisted work: agents can change code quickly, while explicit contracts and tests provide fast evidence for human review.

## Learning outcomes

By the end of the lesson, participants should be able to:

- write a small function with explicit arguments, defaults, and a stable return contract;
- create project files with `{usethis}`;
- apply a trusted function with `purrr::map()` and `purrr::map_dbl()`;
- reject invalid inputs early with `{assertthat}`;
- run `{testthat}` tests in a non-package R project;
- use contracts, assertions, tests, and diff review to assess agent-produced changes.

## Materials

- `Presentation/presentation.qmd` is the 49-slide lesson source, including the three-slide outro retained from the earlier presentation.
- `R/Exercises/01_functionals.R` contains the function and mapping tasks.
- `R/Exercises/02_assertions.R` contains the input-assertion task.
- `R/Exercises/03_tests.R` contains the test-creation task.
- `R/Exercises/Solutions/` contains matching completed scripts and reusable solution files.
- `R/Functions/rescale_to_01.R` contains the reusable teaching example.
- `R/Tests/test-rescale-to-01.R` contains the maintained course checks.
- `R/run_tests.R` also discovers participant tests under `tests/testthat/`.

Run all available tests from a fresh R session:

```r
Rscript R/run_tests.R
```

Render the presentation and synchronize both publication copies:

```r
Rscript R/render.R
```

Rendering does not install packages, restore the environment, or download data. Run `R/___Init_project___.R` separately when setting up or deliberately updating dependencies.

## Teaching scope

The lesson concentrates on functions, arguments, DRY, functionals, the `{purrr}` mapping pattern, assertions, unit tests, and the basic idea of test-driven development. The former Functional Project and `{targets}` material belongs to the separate SSoQE Reproducible Analytical Pipelines lesson.

The functions and functionals sequence adapts this repository's [pre-2026 presentation](https://github.com/SSoQE/SSoQE-Functional_Programming_in_the_World_of_AI/blob/1842463/Presentation/presentation.qmd), while the exercises now stay with Palmer Penguins throughout.

## Licence

See [LICENSE](LICENSE).
