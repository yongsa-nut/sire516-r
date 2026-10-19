# SIRE 516 — Final project: the BioHackathon AI survey

**Due Monday 16 November 2026, 09:00. You present it in class that day.**

## What you do

105 people answered a survey on how they use AI in their work, and an article describes
the data. Ask the survey one question that the article does not answer. Answer it with
`lm()`, as in Class 7. Then say honestly what the answer shows and what it cannot show.

The article summarises the answers in one figure, one question at a time, and never
compares one answer with another. A question that relates two columns, such as
satisfaction and institutional support, is one it leaves open.

You work on your own, and everyone uses the same data.

## The data

The survey went to the community around the 2025 BioHackathon in Japan: 52 of the 105
took part in it, 17 only in earlier BioHackathons, and 36 in none (the column
`bh_participant`). Their answers are public and free to reuse.

- **The files** are in `data/survey/` in your course folder, the one with `SIRE516.Rproj`.
  The table you analyse is `Biohackathon2025AISurvey_data_cleaned_ENG_R1.csv`: one row per
  person, 33 columns. If your folder has no `data/survey/`, download the course folder
  again (the README, step 3) into a new folder, and work there.
- **`project-eda.Rmd`** reads the table with you, and the class goes through it together on
  Tuesday 20 October. It reproduces the article's Figure 1, the project's first step, so
  you do not need to do that again; it also finds the traps in the table. Start
  your own R Markdown file in the course folder, and copy from `project-eda.Rmd` the
  reading and fixes that your columns need. Its section 8, *Where to take it*, lists
  questions the table can support; pick one that explains a 1–5 score, so that `lm()` can
  answer it (part 3 below).
- **The article:** Sriwichai et al. (2026), *AI in practice: a multilingual survey of 2025
  BioHackathon participants*, GigaByte, <https://doi.org/10.46471/gigabyte.179>
- **The data's home:** GigaDB, <https://doi.org/10.5524/102783>

## What your document contains

One R Markdown document, knitted to HTML, in six parts.

**1. Your question.** One sentence at the top of the document, and the columns that answer
it. Decide it before you fit any model. Class 7, section 8 showed why: one gene, six
reasonable analyses, and one came out at p = 0.03. Choose the analysis after seeing the
p-values, and chance alone can hand you a "finding".

**2. Look first.** For every column you use:

- count its values, and its blanks (for a tick-box column, count each box, as
  `project-eda.Rmd` section 5 does)
- open the questionnaire (`…_GoogleForms.pdf`) and say why the blanks are there, if it can
  tell you
- write down each choice you make, and why: which rows you keep, what a blank means, how you
  read a cell that holds several answers

Draw at least one figure, and say what it is for (Class 6).

**3. The model.** `lm()` needs a number to explain. The numbers in this table are its 1–5
scores, such as `satisfaction_score` or `inst_support_score`. A score is treated as a
number here, as `project-eda.Rmd` does. That assumes every step on the scale is the same
size, 1 to 2 as large as 4 to 5; say so in your write-up. If the predictor is a score too,
the same goes for it. Like every `lm()`, the model also assumes a straight line, and the
same spread of points around it everywhere.

With groups, check which one is the baseline, the group the others are compared with. For
text it is the first value in alphabetical order (Class 7, section 4). For TRUE and FALSE
it is FALSE, and the coefficient's name ends in `TRUE`. For a factor it is the first
level, unless that level has no rows left once the rows with blanks are dropped (Class 7,
section 3); then it is the next. To compare against another group, put that group first in
the levels (`project-eda.Rmd`, section 3).

Read the model with `summary()` and `confint()`, and write out the fitted equation. Then
report the result: the estimate, its 95% interval, then the p-value. Write one sentence for
each coefficient that answers your question. Class 7's sentence is the pattern:

> OHT lowered TFF1 by 4,185 CPM against Control (95% CI 2,892 to 5,479; p = 0.0002).

*Lowered* is fair there, because the treatments were assigned. Nobody in the survey was
assigned anything, so write a comparison instead.

- Between groups: *people who … rated their satisfaction … points higher, on average, than
  people who … (95% CI … to …; p = …)*.
- Against a number, as in Class 7, section 3: *people whose support rating was one point
  higher rated their satisfaction … points higher, on average (95% CI … to …; p = …)*.

If the estimate is below zero, write *lower*. When the whole interval is below zero too,
drop the minus signs, as the TFF1 sentence does; otherwise give the interval as `confint()`
prints it. With more than one predictor, add *with the same …* for the others (Class 7,
section 5).

**4. Read it honestly.** Take the four rules from Class 7, section 6, one at a time, and say
whether each matters for your result, and why:

1. Not significant is not "no effect".
2. Significant is not important.
3. A comparison, not a cause.
4. The samples must be independent.

If you fitted more than one model, report every one of them, not only the one that came
out best. A result you found by trying several is a lead, not a finding (Class 7,
section 8).

**5. What the survey cannot tell you.** Two or three sentences. Who answered, how small your
groups are, and what the blanks might hide. `project-eda.Rmd` section 8 lists what to
consider.

**6. AI use.** If you used an AI tool: what you asked it, and what you checked in the data
before you believed the answer. If you did not, say so in one line.

## The presentation, Monday 16 November

Ten minutes, questions included. Present from your knitted HTML; you do not need slides.
Cover the question, the choices you made in part 2, the answer, and what it cannot show.

You may be asked about any line of your code.

## What you hand in

By **09:00 on Monday 16 November**, email the instructor:

- your `.Rmd` file
- the HTML it knits to

The `.Rmd` must knit from the course folder, reading the data as `data/survey/…`, with no
`setwd()` and no `install.packages()`.

## How it is graded

The project is 30% of your SIRE 516 grade. It is scored out of 100:

| Part | Points | Full marks when |
|---|---|---|
| The document | 10 | It knits with no errors from the course folder, and has all six parts |
| The question | 10 | One question the article does not answer, stated at the top, with its columns named |
| Look first | 25 | Values and blanks counted for every column used; the blanks explained from the questionnaire where it can; a figure with its purpose; every choice written down |
| The model | 25 | An `lm()` that answers the question; `summary()` and `confint()`; the fitted equation; each result in one sentence, the estimate and interval before the p-value, worded as a comparison |
| Read it honestly | 20 | Each of the four rules checked against your result; every model you fitted reported; what the survey cannot tell you |
| The presentation | 10 | The question, the choices, the answer and its limits, in time; you can explain your code |

Code you cannot explain earns no marks.

## Where Class 7 comes in

| Class 7 | In your project |
|---|---|
| §3 A line through points | A score against another number: satisfaction against institutional support |
| §4 A group is a number too | A score between two groups: satisfaction, for people who did and did not tick *outputs are inaccurate or unreliable* (4 people have no answer there; the questionnaire explains one of them) |
| §5 More than one predictor | One comparison, adjusted for something else |
| §6 Reading a result honestly | Part 4, rule by rule |
| §7 Many genes, many tests | Count the tests behind any p-value you report |
| §8 Many analyses, one gene | The question decided before the model, and every model reported |
| §10 The one-pager | If you want to name the test your model is the same as |

> **Look at the answers under a number before you report it. Decide the question before
> you see the p-value.**
