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

## 4. Write it down, See Table Below

--- 
<br> 

| Paper | Research Question | Methodology | Key "aha" moment | Relevance to my work |
| :--- | :--- | :--- | :--- | :--- |
| Athey | Causal Inference vs. ML | Meta analysis | the hotel pricing example | fundamental difference between econ and data science 
| Card | Causal Effect of Education on Earnings | IV and family fixed-effects | within family and between family fixed effect, IV have higher upward bias than OLS, possible selection bias on groups affected by structural innovation such as pupil teacher ratio | canonical paper on IV and education
| Card | Causal Return on Education | IV and RCT | "" | seminal paper for return on education | 
| Spence | Signaling via Education Cost | Theory | Applicants will invest in a signal if the offered wage increase is greater than the cost of acquiring the signal, high-productivity workers must find it cheaper or easier to signal than low-productivity workers. | education is not actually making the workers more productive; it simply acts as a prerequisite to prove they are high-productivity | 
| Acemonglu | Why do new technology complement skills? Directed technical change and wage inequality | 

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
