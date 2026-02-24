# Research Assistant Interview Preparation Strategy (Python-Focused)

**8-Week Intensive, High-Yield Plan**

**Core Focus Areas**

1. Causal inference & econometrics
2. Statistical modeling
3. Applied machine learning
4. Data ingestion, processing, and reproducibility in Python

---

## How to Use This Plan

* **Weekdays (1–2 hrs):** drills + implementation
* **Weekends (3–5 hrs):** reading + simulations + synthesis
* Bias toward **doing**

---

## Core Study Loop

1. Read or watch **one focused concept**
2. Reproduce it from scratch in Python
3. Stress-test with data
4. Write a short causal or modeling interpretation
5. Identify assumption violation

---

# Reference Stack

### *Python for Data Analysis* — Wes McKinney

Priority chapters:

* Ch. 4–7: NumPy & Pandas mechanics
* Ch. 8: Data reshaping & joins
* Ch. 9: Visualization for diagnostics
* Ch. 12: Time series basics

Usage rules:

* Re-type code manually
* Rewrite with `.pipe()` and `.assign()`

---

## Statistics, Econometrics & Causal Inference (Core)

### *Mostly Harmless Econometrics* — Angrist & Pischke

Primary goals:

* Regression as conditional expectation
* Identification vs estimation
* Difference-in-differences intuition
* Instrumental variables logic


### *Causal Inference for the Brave and True* — Facure

Core focus:

* DAGs and backdoor criteria
* Potential outcomes
* ATE, ATT, heterogeneous effects
* Explicit assumptions via simulation

### *StatQuest* (Selective)

For intuition only:

* Bias–variance tradeoff
* PCA intuition
* Regularization
* t-test and chi-squared

### *OpenIntro Statistics*

Reference only:

* t-tests
* chi-square
* sampling distributions
* experimental design

---

## Machine Learning

### *Intro to Statistical Learning:*

* Linear & logistic regression
* Regularization (L1/L2)
* Trees & random forests (intuition-level)
* Cross-validation
* Feature leakage & overfitting
* scikit-learn
* statsmodels

**Rule:** ML is used for **prediction, diagnostics, or robustness**, not causal claims.

---

## SQL (Supporting Skill)

* JOINs
* GROUP BY
* Window functions
* Translating SQL to Pandas logic

---

# 8-Week Study Plan

---

## WEEK 1 — Python Data Ingestion, Sanity Checks & DGPs

**Objective:** Turn raw data into a trustworthy DataFrame under live-coding pressure

### Checklist

### Mock Interview Prompt

> Load an unfamiliar dataset in Python.
> Show how you assess data quality, identify the unit of observation,
> and flag potential data or selection issues.

---

## WEEK 2 — Pandas Core Manipulation & Feature Engineering

**Objective:** Pandas under live-coding constraints

### Checklist

* GroupBy + aggregate
* Sorting, ranking, and filtering
* Vectorized conditionals (`np.where`, `.loc`)
* Avoid Python loops entirely
* Clean chaining with `.assign()` and `.pipe()`

### Mock Interview Prompt

> Given transaction-level data, compute average spend per user per month,
> construct one additional feature, and explain your Pandas logic step by step.

---

## WEEK 3 — Python-Based Statistical Inference & Diagnostics

**Objective:** Implement statistical tests correctly and explain them clearly in code

### Checklist

* Compute summary statistics programmatically, use statsmodels econometrics lib
* t-tests using `scipy.stats` or manual formulas
* Confidence intervals
* Bootstrap procedures in Python
* Assumptions embedded in each test

### Mock Interview Prompt

> Using Python, test whether a treatment changed an outcome.
> Walk through the code, assumptions, and interpretation.

---

## WEEK 4 — Statistical Inference & Uncertainty

**Objective:** Correct inference and clear interpretation of econometrics 

### Checklist

* t-tests and nonparametric alternatives
* Confidence intervals
* Bootstrap procedures
* Explicit assumptions
* Practical interpretation of uncertainty
* Review Gauss Markov and BLUE

### Mock Interview Prompt

> A team claims a feature increased conversion.
> Test the claim and explain uncertainty to a non-technical stakeholder.

---

## WEEK 5 — Regression & Identification

**Objective:** Regression as a causal reasoning tool

### Checklist

* Fit and interpret OLS
* State identification assumptions
* Diagnose omitted variable bias
* Functional form checks
* Robustness intuition


### Mock Interview Prompt

> Regress wages on education and experience.
> Interpret the education coefficient and discuss identification.

---

## WEEK 6 — Quasi-Experimental Methods

**Objective:** Applied causal inference

### Checklist

* Difference-in-differences setup
* Parallel trends assessment
* Event-study plots
* Placebo and falsification tests
* IV intuition (relevance & exclusion)

### Mock Interview Prompt

> Estimate a policy effect using DiD and explain how you validate assumptions.

---

## WEEK 7 — Machine Learning for Economists

**Objective:** Prediction with discipline and restraint

### Checklist

* Train / test splits
* Cross-validation
* Regularization (L1 / L2)
* Feature leakage detection
* Interpretation over accuracy

### Mock Interview Prompt

> Build a predictive model and explain why it does not identify causal effects.

---

## WEEK 8 — Full RA Simulation

**Objective:** Calm, end-to-end execution under time pressure

### Checklist

* Raw data ingestion
* One clean analysis pipeline
* One causal or predictive model
* Clear written summary
* Verbal explanation

### Drill Types

* 60-minute mock screens
* End-to-end analyses
* Oral walkthroughs

### Mock Interview Prompt

> In 60 minutes, clean a dataset, estimate an effect,
> and summarize findings in a short research memo.

# Gemini Game Plan

## 1. High-Frequency Pandas Patterns

In a live coding session, Amazon interviewers look for "vectorized thinking." If you use a `for` loop to iterate over rows, it’s usually a red flag. Focus on these patterns:

* **Split-Apply-Combine:** This is the heart of data analysis. You must be comfortable using `.groupby()` not just for simple sums, but with `.transform()` (to broadcast values back to original rows) and `.apply()` (for custom logic).
* **Window Functions:** Be ready to calculate rolling averages, cumulative sums, or "lagged" variables using `.shift()`, `.rolling()`, and `.expanding()`.
* **Reshaping & Pivoting:** You will likely get "long" data and need to make it "wide" (or vice versa) using `.pivot_table()` and `.melt()`.
* **Complex Joins:** Understanding how to handle many-to-many joins and how to use `.merge()` vs. `.concat()` is essential.

---

## 2. The Statistical Modeling Workflow (`statsmodels`)

Amazon cares about **inference**, not just prediction. You need to be able to explain *why* a variable matters, not just get a high R-squared.

* **OLS & Logistics Regression:** Know how to interpret the `summary()` output. You should be able to explain coefficients, p-values, and R-squared in plain English.
* **Residual Analysis:** In a live session, you might be asked to check if your model is valid. Know how to plot residuals to check for heteroscedasticity or non-normality.
* **A/B Testing (Hypothesis Testing):** Use `statsmodels.stats` or `scipy.stats` to perform t-tests, chi-square tests, and power analysis.
> **Tip:** Practice calculating the "Minimum Detectable Effect" (MDE), as Amazon is obsessed with the ROI of their experiments.



---

## 3. The "Amazon Style" Data Cleaning

In an interview, you'll likely get a "messy" version of the CPS data. Practice these specific cleaning patterns:

| Concept | What to Master |
| --- | --- |
| **Missing Data** | Don't just `dropna()`. Know when to use `.fillna(method='ffill')` vs. median imputation. |
| **Categorical Encoding** | Be ready to use `pd.get_dummies()` or explain why you’d use Label Encoding. |
| **Datetime Logic** | Converting strings to `datetime`, extracting day-of-week, and calculating time deltas (e.g., "time since last purchase"). |
| **Outlier Detection** | Use the IQR method or Z-scores to identify and handle outliers. |

---

## 4. Your 2-Month Roadmap

### Weeks 1-2: Speed and Fluency

Stop using the documentation. Practice the "top 20" Pandas functions until they are muscle memory.

* **Goal:** Solve "Pandas-style" LeetCode or Stratascratch problems (medium difficulty) in under 15 minutes.

### Weeks 3-5: End-to-End Case Studies

Mixed problems: econ + stats + Python

1. **EDA:** 3-5 visualizations (Matplotlib/Seaborn) showing distributions and correlations.
2. **Cleaning:** Document every choice (e.g., "I'm removing these outliers because...").
3. **Modeling:** Run a regression and interpret the impact of a specific feature.

### Weeks 6-8: Mock Interviews & Optimization

Practice explaining your code *while* you write it.

* **Focus on Complexity:** If you have a large dataset, how would you optimize your code? (e.g., using `category` dtypes or `parquet` files).
* **Business Context:** Always tie your result back to a business metric (e.g., "This model suggests a 5% increase in retention if we change X").

---

## Recommended Practice Drill

To simulate an Amazon interview, try this 45-minute drill with your CPS data:

1. **Load & Clean:** Find the average hourly wage per state, handling missing values and adjusting for inflation.
2. **Visualize:** Create a boxplot showing the wage distribution for different education levels.
3. **Stat Test:** Is the difference in wages between "Bachelors" and "Masters" holders statistically significant?
4. **Model:** Run a regression to predict wage based on age, education, and state. Interpret the coefficient for "Age."

