<div align="center">

<img src="https://ssoqe.github.io/SSoQE_website/photos/SSOQE_logo3.png" width="150" alt="SSoQE logo">

# Functional Programming in the World of AI

**SSoQE 2026 · Wednesday, 16 September · 09:00–10:30**

[SSoQE website](https://ssoqe.github.io/SSoQE_website/) · [2026 programme](https://ssoqe.github.io/SSoQE_website/About/program.html)


| **📅 Course information** | **🧰 Technical** | **📌 Status** |
|:---:|:---:|:---:|
| ![SSoQE 2026](https://img.shields.io/badge/SSoQE-2026-155560) | ![Type](https://img.shields.io/badge/Type-Course_Module-155560) | ![Status](https://img.shields.io/badge/Status-Active-509A8E) |
| ![Day](https://img.shields.io/badge/Day-Wednesday-C2A337) | ![Topic](https://img.shields.io/badge/Topic-Programming_and_AI-155560) | ![Tools](https://img.shields.io/badge/Tools-R_%7C_Quarto-276DC3) |

</div>

## 🌿 About the lesson

This 2026 lesson develops functional-programming skills for reliable ecological analysis in a world where code may also be drafted or reviewed with AI tools. Fossil-pollen workflows provide the working examples, but the main objective is to design small, explicit, testable functions and connect them into reproducible analyses.

The repository retains its historical name because the earlier version focused specifically on functional programming with fossil-pollen data.

## 🎯 Learning goals

By the end of the lesson, participants should be able to:

- turn repeated analytical steps into reusable functions with explicit inputs and outputs;
- separate orchestration code from reusable analytical logic;
- use iteration and dependency-aware workflows instead of copying blocks of code;
- evaluate AI-generated R code for correctness, clarity, reproducibility, and hidden assumptions.

## 📚 Materials

- `Presentation/presentation.qmd` is the existing slide source.
- `R/Exercises/Functional project/` contains progressive functional-programming exercises.
- `R/Exercises/Functional workflow/` contains a larger workflow exercise.
- `R/Project/` contains the project workflow and reusable functions.
- `Data/Input/sel_polygon.JSON` is an input used by the pollen workflow.

The repository includes `renv.lock` and tracked `_targets/` metadata. Do not assume the metadata is current proof that the complete pipeline runs; verify the actual workflow entry point before execution.

## 🚧 2026 revision status

The title and scope now follow the 2026 programme. The current presentation still contains older SSoQE 2024 material, so its AI-focused revision remains teaching-content work rather than a README-only change.

## 📄 Licence

See [LICENSE](LICENSE).
