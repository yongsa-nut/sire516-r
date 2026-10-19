# AI in Practice: BioHackathon 2025 Survey Dataset

## Overview

This repository contains the anonymized survey data and supporting materials for:

**AI in Practice: Insights from a Community Survey of BioHackathon Participants**

The survey targeted participants and community members around the 2025 BioHackathon in Japan and was offered in English, Japanese, and Thai. It captures:

- BioHackathon participation history  
- Scientific field and institution type  
- Self-reported AI usage level 
- Tasks for which AI is used (coding, research, brainstorming, writing/editing, teaching, translation, personal use)  
- Challenges, satisfaction, and desired improvements  
- Perceived institutional support  
- Concern about AI-related harms 

This dataset is intended to support research on real-world AI practice in bioinformatics and related communities, cross-regional comparisons, and methodological work on AI adoption in scientific workflows.

---

## File structure 

### 1. Raw data

- `raw/Biohackathon2025AISurvey_data_raw_anon_original_languages_R1.csv`  
  - Anonymized responses in English, Japanese, and Thai. Structured items plus short free-text fields.  
  - Email/citation-link questions removed; URLs in free text replaced with `[URL redacted]`.

- `raw/Biohackathon2025AISurvey_data_raw_anon_ENG_v1.csv`  
  - English-only version of the anonymized raw data, harmonized using the translation lookup table. 

  
### 2. Processed / analysis-ready data
- `processed/Biohackathon2025AISurvey_data_cleaned_ENG_R1.csv`  
  - Cleaned English dataset for quantitative analysis. Long narrative free-text fields removed.  
  - Column headers converted to programmatic `snake_case`.

- `processed/Biohackathon2025AISurvey_codebook_cleaned_ENG_R1.csv`  
  - Complete data dictionary mapping the 34 cleaned, programmatic column names to their original survey questions, variable types, and response options.


### 3. Questionnaire and translations

- `questionnaire/Biohackathon2025AISurvey_GoogleForms.pdf`  
  - Full PDF export of the survey, including skip logic and all language versions.  

- `questionnaire/Translation_lookup_table_R1.csv`  
  - Lookup table aligning controlled-response options across English, Japanese, and Thai.

---

## Key Variables (cleaned English dataset)

The cleaned dataset includes:

- **BioHackathon participation** (multi-select)  
- **Research Field** (multi-select, with “Other: free-text” option)  
- **Institution type** (multi-select, with “Other: free-text” option)  
- **Country** (free-text)  
- **Age group, gender**  
- **Overall AI usage level** (e.g. daily user, weekly user, AI researcher/developer)  
- **Reasons for not using AI** (multi-select, with “Other: free-text” option)  
- **Most frequently used AI tools** (free-text)  
- **Task-specific AI usage** for: coding, research, brainstorming, writing/editing, teaching, translation, personal use  
- **Challenges when using AI** (multi-select, with “Other: free-text” option)  
- **Overall satisfaction with AI** (1–5 scale)  
- **Desired improvements in AI tools** (multi-select, with “Other: free-text” option)  
- **Perceived institutional support** (1–5 scale) and **types of support** (multi-select, with “Other: free-text” option)  
- **Concern levels** for: bias in algorithms, data privacy/security, intellectual property/ownership, misinformation/hallucinations, environmental impact (1–5 scales)

See the codebook for the full variable list.

---

## Anonymization and Data Cleaning

- No names, email addresses, usernames, IP addresses, or institutional identifiers were collected.  
- The optional email field and the optional “link to your work” question are excluded from released data.  
- URLs in free-text responses were replaced with `[URL redacted]`.  
- Long narrative free-text responses were kept in the anonymized raw dataset but excluded from the cleaned dataset.  
- Free-text "Country" entries were standardized to resolve common spelling variations, abbreviations, and capitalization (e.g., mapping "U.K." to "United Kingdom" and "germany" to "Germany"). Clearly invalid narrative entries (e.g., "Postdoctoral researcher") were set to missing.
- Free-text AI tool lists were standardized to consolidate spelling variations (e.g., 'chat gpt' to 'ChatGPT'), generalize ambiguous product names (e.g., mapping 'copilot' to 'Copilot (unspecified)' to account for both Microsoft and GitHub variants), and filter out non-tool narrative fragments or generic terms.
- For categorical questions with an "Other" option, the user's custom free-text answers were programmatically extracted into dedicated, intact `_other_text` companion columns to maintain structure for automated analysis.

---

## Important Design Limitation (Tasks and “Not used”)

- **Starts vs. Completions:** The survey was administered via standard Google Forms. Because this platform does not track session data or abandonment rates, the total number of survey "starts" is unavailable. The dataset contains exactly 105 rows, representing all finalized and submitted responses, confirming structural consistency.
- **Missingness in Optional Questions:** To reduce pressure on participants, almost all questions were optional. Consequently, domain-specific items exhibit expected high missing rates. For example, the "Teaching and curriculum" task usage had ~40% missingness rate, likely reflecting respondents who are not involved in education. Similarly, specific ethical concerns like "Data privacy/security" and "Bias in algorithms" saw high non-response rates. Re-users of this dataset should note that missingness in these specific items may not be completely random and should handle NA values appropriately.
- **Task Usage "Not Applicable":** For the task-specific AI usage items (coding, research, brainstorming, writing/editing, teaching, translation, personal use), respondents chose one of: *Assist*, *Draft*, or *Complete*. The survey did not include an explicit "Not used" or "Not applicable" option, meaning a missing response conflates three distinct states: non-use, non-applicability to the respondent's role, or a choice not to answer.
- **Survey Skip Logic:** Certain questions have intentionally high missing data rates due to survey routing. The question "Is there a reason why you don't use AI?" was only presented to non-users. The follow-up "What would AI tools need to improve?" was only presented to respondents reporting lower satisfaction (scores 1–3) and was skipped for satisfied users (scores 4–5) to reduce survey fatigue.
- **AI Concern Items:** The questions regarding concerns about AI (e.g., bias, data privacy) used a 1–5 scale without explicit "No opinion" or "Don't know" options. Missing data in these columns represents a non-response where the underlying reason cannot be determined.

## Ethics

- The survey collected only anonymous responses and did not request direct identifiers such as name, institutional affiliation, or IP address. Google account–level information (e.g., respondent email or login identity) was not recorded. One optional question asked for an email address for possible follow-up; no respondents have been contacted, and all email addresses have been removed prior to dataset release.
- To reduce bias and pressure to respond, only two items were minimally required (survey language and an AI usage level question). All other questions were optional, and respondents could skip any item they preferred not to answer.  
- Participation was voluntary. Respondents could stop at any time by closing the survey without submitting their responses.  
- The survey introduction explained that the goal was to understand how BioHackathon participants use AI in their work and to build a community resource that would be shared back with participants in aggregated form.  
- Free-text responses were reviewed and processed to remove URLs and any potentially identifying details before inclusion in the released dataset.  
- No formal ethics review or institutional board approval was sought for this work. Under typical institutional guidelines, anonymous, voluntary surveys of professionals on their work practices are generally considered minimal risk, but users of the dataset should interpret and apply it in accordance with their own local ethical and governance requirements.


---

## Citation

A suggested citation will be added once the associated article is accepted. Until then, please cite the dataset as:

> Sriwichai N, et al. (2025). AI in Practice: BioHackathon 2025 Survey Dataset. GigaDB. Version 1.0.0.

---

## Contact

For questions about the dataset or to report issues:

- **Corresponding author:**  
  Chatarin (Chad) Wangsanuwat  
  Siriraj Long-read Lab (Si-LoL), Medical Bioinformatics, Siriraj Genomics, Faculty of Medicine Siriraj Hospital, Mahidol University, Thailand  
  [chatarin.wan@mahidol.ac.th]
