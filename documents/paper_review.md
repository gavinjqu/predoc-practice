# How to Read Econ Papers
#### Gavin Qu, 01/24/2026

## 1. The Identification
* The counterfactual 
* Source of variation
* The exclusion restriction
* external validity 

## 2. ML vs Causal Method
* $R^2, MSE$ vs. bias of $\hat{\beta}$

## 3. Three Passes
    1. The scan - Abstract, Intro, Conclusion and Tables
    2. Institutional context and data
    3. Robustness check - do results change after adding control or sample changes?

## 4. Write it down, See Table and Templates Below

--- 
<br> 

| Paper | Year | Research Question | Methodology | Key "aha" moment | Relevance to my work |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Athey | xxxx | Causal Inference vs. ML | Meta analysis | the hotel pricing example | fundamental difference between econ and data science 
| Card | xxxx | Causal Effect of Education on Earnings | IV and family fixed-effects | within family and between family fixed effect, IV have higher upward bias than OLS, possible selection bias on groups affected by structural innovation such as pupil teacher ratio | canonical paper on IV and education
| Card | xxxx | Causal Return on Education | IV and RCT | "" | seminal paper for return on education | 
| Spence | 1973 | Signaling via Education Cost | Theory | Applicants will invest in a signal if the offered wage increase is greater than the cost of acquiring the signal, high-productivity workers must find it cheaper or easier to signal than low-productivity workers. | education is not actually making the workers more productive; it simply acts as a prerequisite to prove they are high-productivity | 
| Acemonglu | xxxx | Why do new technology complement skills? Directed technical change and wage inequality | 
| Athey | xxxx | Causal Forest | How CART can be modified to construct causal forest that is used for valid statistical inference | An Algorithmic approach to use random forest as statistical inference instruments to identify heterogenous treatment effect | Two forests are constructed to form counterfactual | ML methods for casual inference is the frontier of applied method research | 
---

# Four Foundational Questions
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

---

# [Paper Title]
**Authors:** [Author 1, Author 2]
**Year:** [YYYY] | **Journal/Working Paper:** [Journal Name or NBER]
**Tags:** #Methodology (e.g., #IV, #DiD), #Topic (e.g., #Labor, #Health), #Data (e.g., #Administrative, #WebScraped)

---

### 1. What is the causal relationship of interest?
* **The Core Question:** (What is the exact counterfactual prediction being made? *Check: Is this a Fundamentally Unidentifiable Question (FUQ)?*)
* **The Stakes:** (If this estimate is right, what theoretical model gets updated, or what policy changes?)

### 2. What is the ideal experiment?
* **The Gold Standard RCT:** (If you had infinite money and zero ethical constraints, what randomized controlled trial would perfectly capture this causal effect?)

### 3. What is the identification strategy?
* **The Method:** (How is observational data being used to approximate the ideal experiment? e.g., Regression Control/CIA, IV, DiD, RD.)
* **The Identifying Assumption:** (What MUST be true for this to be causal? e.g., parallel trends, strictly exogenous instrument, random assignment around the cutoff.)
* **Control Strategy & "Bad Controls":** (What observable covariates are held fixed? *Check: Are they making the mistake of controlling for variables that are themselves outcomes of the treatment?*)
* **The Data Architecture:** (What is the primary dataset? What is the core challenge in their data pipeline?)

### 4. What is the mode of statistical inference?
* **Sample vs. Population:** (What specific population is explicitly studied, and what sample is drawn from it?)
* **Standard Errors & Clustering:** (How are they constructing standard errors? *Check: Are they properly handling group structures/the Moulton problem and serial correlation to avoid false significance?*)

### 5. Internal vs. External Validity (The Seminar Attack)
* **Internal Validity:** (Does the design successfully uncover the true causal effect for this specific sample? If I were in a seminar, what unobserved confounder or exclusion restriction violation would I attack?)
* **External Validity / LATE:** (Can this predict outcomes in different contexts? If using an IV, who exactly are the "compliers," and what is the Local Average Treatment Effect?)

### 6. Idea Generation (Spillovers)
* **The Method-Data Swap:** (Could I take this exact identification strategy and apply it to a dataset I have access to?)
* **The Next Step:** (What is the obvious follow-up paper that hasn't been written yet?)