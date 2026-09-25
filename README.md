# SIRE 516 — R Programming for Bioinformaticians, Classes 4–7

One R Markdown document per class, and the data they use. Each document has blank code
boxes — *chunks* — for you to fill in during class.

**Set up before Class 4, at least a day before.** It takes about thirty minutes, most of it
waiting on downloads. If something goes wrong you want time to ask, and thirty people
installing at once on the classroom wifi does not work.

---

**Check your system first.** RStudio supports Windows 11 and macOS 14 (Sonoma) or newer. On
an older system, skip to *If you cannot install anything* below, which needs no installs.

## 1. Install R

Install **R first, then RStudio** — RStudio looks for R when it starts, so the order matters.

- **Windows** — https://cran.r-project.org/bin/windows/base/
- **Mac** — https://cran.r-project.org/bin/macosx/
  Take `arm64` for an Apple chip (M1 and later), `x86_64` for an Intel Mac. Apple menu →
  **About This Mac** shows which you have.

Install **R 4.6.1** and accept every default in the installer. The course is tested on
4.6.1, and older versions behave differently in ways Class 4 shows you.

*Already have R?* If it is older than 4.6.1, install 4.6.1; you can leave the old version
where it is. Step 6 checks which one RStudio uses.

## 2. Install RStudio

https://docs.posit.co/ide/user/#rstudio-ide-oss-downloads — take **RStudio Desktop**, the
open-source edition, and the installer for your system (`.exe` on Windows, `.dmg` on Mac).
Accept every default.

R is the language; RStudio is the window you write it in. You need both, and from here on
you only ever open RStudio.

## 3. Download this folder

On this page, click the green **Code** button, then **Download ZIP**.

- **Windows:** right-click the ZIP and choose **Extract All**. Double-clicking only shows
  what is inside, and R cannot work from there.
- **Mac:** double-click the ZIP; it unpacks into a folder. (Safari may already have
  unpacked it for you.)

The folder you want is the one with `SIRE516.Rproj` in it; it may sit one folder deeper
than you expect. Move it somewhere you can find again — Documents is fine. A short path
with no spaces or Thai characters, such as `C:\sire516` on Windows, is the safest.

## 4. Open the project

In that folder, double-click **`SIRE516.Rproj`**. (Windows may hide the ending and show
just `SIRE516`.) RStudio opens, with the folder's name at the top right.

## 5. Install the packages

Find the **Console** — the pane with a `>` prompt. Paste this in and press Enter:

```r
install.packages(c("tidyverse", "rmarkdown"))
```

**Questions may come up while this runs. The answers matter:**

| Question | Answer | Why |
|---|---|---|
| *"Would you like to use a personal library instead?"* | **Yes** | R cannot write to its own folder; this is normal |
| *"Would you like to create a personal library … to install packages into?"* | **Yes** | The same, the first time only |
| *"Do you want to install from sources…?"* | **No** | Saying yes starts a compile that takes a long time and usually fails |

Say **no** to the last one every time, all term. It will keep asking.

This downloads about a hundred packages, so it is most of the wait. When the `>` prompt
comes back and nothing is still scrolling, it is done. Red text is not automatically a
problem: a line starting `Warning` is usually fine; a line starting `Error` is not.

## 6. Check it worked

Paste this into the Console:

```r
R.version.string
library(tidyverse)
read_csv("data/metadata.csv")
```

The first line should say **4.6.1**. `library(tidyverse)` then lists the packages it loaded
and a few "conflicts" — that is normal. After a short summary of the columns, you should
see a table headed `# A tibble: 12 × 5`.
Then, in the **Files** pane at the bottom right, click `class4.Rmd` to open it, and press
**Knit** at the top of the editor.

**If a formatted page opens, you are ready.**

If not, find what you saw:

| What you saw | What it means | What to do |
|---|---|---|
| A version older than 4.6.1 | RStudio is using an older R | Windows: **Tools → Global Options → General → R version**, pick 4.6.1, restart RStudio. Mac: reinstall 4.6.1 |
| `there is no package called 'tidyverse'` | It never installed | Run `install.packages("tidyverse")` |
| `could not find function "read_csv"` | Installed, but not loaded | Run `library(tidyverse)` |
| `'data/metadata.csv' does not exist in current working directory` | R is not looking in the course folder | Close RStudio. Check the folder was extracted (step 3), then double-click `SIRE516.Rproj` in it |
| Knit asks to install packages, or does nothing | `rmarkdown` is missing | Run `install.packages("rmarkdown")` |

Still stuck? Copy the exact error text and send it to the instructor before class.

## If you cannot install anything

Some hospital and work laptops will not allow it, and older systems cannot run RStudio.
Make a free account at **https://posit.cloud**, which runs RStudio in a browser tab:

1. **New Project → New Project from Git Repository.**
2. Paste this page's address, https://github.com/yongsa-nut/sire516-r, and confirm. The
   project opens with this folder already in it.
3. Do steps 5 and 6 there.

Tell the instructor before class if you are doing this.

---

## What is in this folder

| File | What it is |
|---|---|
| `class4.Rmd` … `class7.Rmd` | One document per class. Open the day's file in class |
| `class7-one-pager.html` | Class 7's printable page: common tests as linear models |
| `data/` | The data files the classes read |
| `figures/` | Pictures the documents show |
| `ai_attempt.R` | An AI-written script that Class 5 runs and examines. Leave it as it is |
| `SIRE516.Rproj` | The project file. Always open this first |

## One rule

**Always start by double-clicking `SIRE516.Rproj`.** Open the class documents from
RStudio's Files pane, never by double-clicking a `.Rmd` on its own.

The project tells R which folder it is working in, so file paths like `data/metadata.csv`
just work — on your machine, on the instructor's, and on your classmate's, with no edits.
Every file path in this course is written that way.
