# How to Read Econ Papers
#### Gavin Qu, 01/24/2026

## 1. The Identification
* The counterfactual 
* Source of variation
* The exclusion restriction
* external validity 

## 2. Study Design
* what's the treatment, what's the outcome, what's the threat to identification? 

## 3. Three Passes
    1. The scan - Abstract, Intro, Conclusion and Tables
    2. Institutional context, data, and research question
    3. Identification strategy 
    4. Robustness check - do results change after adding control or sample changes?

## 4. Write it down

Per-paper notes live in [papers/](papers/), one file per paper. The table below is the index. Each linked note holds: identification, methodology, key insight, and relevance to my research.

### Weekly routine

1. Read the paper using the Three Passes above.
2. Copy the template: `cp papers/_template.md papers/{lastauthor}-{year}_{slug}.md`.
3. Fill in the five fields — aim for ~10 minutes; these are notes, not essays.
4. Add a row to the index table below.
5. Skim the last 3–5 notes and add `[[related]]` wikilinks where the new paper connects to old ones — that's how the lit review writes itself over time.

### Index

| Author | Year | Title | Methodology | Note |
| :--- | :--- | :--- | :--- | :--- |
| Athey | 2019 | Causal Inference vs. ML | Meta-analysis | [link](papers/athey-2019_causal-vs-ml.md) |
| Card | 1999 | Returns to Education | IV, family FE | [link](papers/card-1999_returns-to-education.md) |
| Spence | 1973 | Signaling via Education | Theory | [link](papers/spence-1973_signaling-via-education.md) |
| Acemoglu | 1998 | Directed Technical Change and Wage Inequality | Theory | [link](papers/acemoglu-1998_directed-technical-change.md) |
| Athey & Imbens | 2015 | Causal Forest | ML for causal inference | [link](papers/athey-2015_causal-forest.md) |
| Arrow | 1963 | Uncertainty and the Welfare Economics of Medical Care | Theory | [link](papers/arrow-1963_normative-medical-care.md) |
| Callaway & Sant'Anna | 2020 | Staggered DiD | DiD | [link](papers/callaway-santanna-2020_staggered-did.md) |
| Dix | 2025 | Combining Complements (Cancer Treatment Innovation) | Dynamic structural | [link](papers/dix-2025_combining-complements.md) |
| Sadoff | 2024 | College Summer School | RCT + IV-LATE | [link](papers/sadoff-2024_college-summer-school.md) |
| Arrow | 1962 | Innovation and Resource Allocation | Theory | [link](papers/arrow-1962_innovation-resource-allocation.md) |

---

# Four Foundational Questions (From *Mostly Harmless*)
## 1. What is the causal relationship of interest? 
* relationship should be useful for making counterfactual predictions
* The questions must not be "Fundamentally unidentifiable" (FUQ'ed), e.g. age effect in school

## 2. What is the ideal experiment? 
* Gold standard is always RCTs
* Even if a study uses observational data, it should describe the hypothetical ideal experiment that could capture the causal effect. 

## 3. What is the identification strategy?
* Core of modern applied econometrics: how does the researcher use observational data to approximate the ideal randomized experiment. 
* Regression Control and Matching: Using observable covariates to hold confounding factors fixed -> the Conditional Independence Assumption (CIA). 
* Beware of bad control—the mistake of controlling for variables that are themselves outcomes of the treatment (e.g., controlling for occupation when studying the effect of college on wages)
* Instrumental Variables (IV): Using a variable (the instrument) that is correlated with the treatment but uncorrelated with unobserved confounders to isolate quasi-experimental variation. 
* Differences-in-Differences (DiD): Using repeated observations over time to control for unobserved, time-invariant variables by comparing the outcome trends of treatment and control groups. 
* Regression Discontinuity (RD): Exploiting precise, arbitrary rules or cutoffs that determine treatment to mimic a randomized trial in the narrow neighborhood around the cutoff threshold. 

## 4. What is the mode of statistical inference?
* Must clearly describe the population studied, the sample used, and the assumptions made to construct standard errors
* Careful handling of the clustering problem (the Moulton problem) and serial correlation
* Failing to account for these group structures can lead to drastically underestimated standard errors and false claims of statistical significance. 

## 5. Internal vs. External Validity
* Internal validity: Does the research design successfully uncover the true causal effect for the population being studied?
* External validity: Can the study's findings be used to predict outcomes in different contexts or for different populations?
* Instrumental Variables estimates often capture a Local Average Treatment Effect (LATE)—the effect specifically for "compliers" whose behavior was changed by the instrument

### 6. Idea Generation (Spillovers)
* **The Method-Data Swap:** (Could I take this exact identification strategy and apply it to a dataset I have access to?)
* **The Next Step:** (What is the obvious follow-up paper that hasn't been written yet?)

---
