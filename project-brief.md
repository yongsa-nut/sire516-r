# SIRE 516 — Final project: the BioHackathon AI survey

**Due Monday 16 November 2026, 09:00. You present it in class that day.**

## What you do

Pick one question about the survey that its article does not answer. The article describes
the answers one question at a time, so a question that relates two columns, such as
satisfaction and institutional support, is yours to ask. Then answer it with the data:

1. **Look first.** Explore the columns your question needs: their values, their blanks,
   and what the questionnaire says about them.
2. **Show it.** Make two figures that speak to your question. Each one has a job; say what
   it is (Class 6).
3. **Test it.** Fit an `lm()` for the question, as in Class 7. Report the estimate that
   answers it, its 95% interval, then the p-value.
4. **Tell the story.** What you found, how strong the evidence is, and what this survey
   cannot tell you.

You work on your own, and everyone uses the same data.

## The data

105 people around the 2025 BioHackathon in Japan answered a survey on how they use AI in
their work. Their answers are public and free to reuse.

- **The files** are in `data/survey/` in your course folder, the one with `SIRE516.Rproj`.
  If your folder has no `data/survey/`, download the course folder again (the README,
  step 3) into a new folder and work there; on Posit Cloud, start a new project from the
  repository.
- **`project-eda.Rmd`** reads the table with you; the class goes through it together on
  Tuesday 20 October. It rebuilds the article's Figure 1 and finds the traps in the table.
  Its section 8 lists questions to start from; pick one that explains a 1–5 score.
- **The article:** Sriwichai et al. (2026), *AI in practice: a multilingual survey of 2025
  BioHackathon participants*, GigaByte, <https://doi.org/10.46471/gigabyte.179>

A few things to get right:

- `lm()` needs a number to explain. The numbers in this table are its 1–5 scores, such as
  `satisfaction_score` and `inst_support_score`. Four of the five concern scores have no
  1s or 5s (`project-eda.Rmd`, section 6).
- Nobody in the survey was assigned anything, so a result is a comparison, not a cause.
- Decide your question before you fit the model, and report every model you fit in your
  `.Rmd`.
- You may use AI tools. If you do, say in your `.Rmd` what you asked and what you checked
  in the data.

## The presentation, Monday 16 November

Five minutes with slides, then five minutes of questions. Your two figures go on the
slides, and they carry the story, so make them good. You may be asked about any line of
your code.

## What you hand in

By **09:00 on Monday 16 November**, email the instructor:

- your `.Rmd` file; it must knit from the course folder
- your slides

## How it is graded

The project is 30% of your SIRE 516 grade.

| Part | Share |
|---|---|
| Presentation | 50% |
| Questions and answers | 30% |
| Code | 20% |

> **Look at the answers before you report a number.**
