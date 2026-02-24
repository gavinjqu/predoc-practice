# Task 6: Full Predoc Simulation

**Difficulty:** Advanced
**Target time:** 5-6 hours (timed)
**Skills tested:** End-to-end pipeline — data cleaning, feature construction, analysis, visualization, memo writing
**Recommended week:** 7-8

---

## Time Allocation (Suggested)

| Phase | Time |
|-------|------|
| Data loading & assessment | 30 min |
| Data cleaning & merge | 60 min |
| Descriptive analysis | 45 min |
| Regression analysis | 60 min |
| Visualization | 45 min |
| Write-up | 30 min |
| Review & polish | 30 min |

**Start a timer when you begin. Record your actual time at each phase.**

---

## Background

A policy research group is evaluating whether a state-level earned income tax credit (EITC) expansion affected labor force participation among single mothers. In 2018, 12 states expanded their state EITC supplements, while the remaining states did not. You have been given messy administrative and survey data and asked to produce a clean analysis with results and a research memo.

## Data

This task uses **synthetic data** generated in the notebook's setup cell. The data deliberately contains real-world messiness:

**Dataset 1: individual_survey.csv** (~50,000 rows)
- person_id, state, year (2015-2022), age, sex, marital_status, num_children, education, employed, hours_worked, annual_earnings
- Messy elements: some state names are abbreviated, some are full names; age has a few negative values; earnings has "$" and "," in strings; some employed=1 but hours_worked=0; duplicate person-year rows

**Dataset 2: state_policy.csv** (50 rows)
- state_name, eitc_expansion (1/0), expansion_year, state_population, median_hh_income
- Messy elements: state names don't perfectly match Dataset 1; two states have conflicting expansion_year values

**Dataset 3: state_economics.csv** (400 rows, 50 states x 8 years)
- state, year, unemployment_rate, gdp_per_capita, min_wage
- Messy elements: some years are stored as strings with extra whitespace

## Questions

### Part A: Data Assessment & Cleaning

1. Load all three datasets. For each, document: shape, data types, missing values, apparent data quality issues.
2. Clean each dataset. For every cleaning decision, write a brief inline comment explaining your choice (e.g., "Dropping 23 rows with negative age — likely data entry errors").
3. Harmonize state identifiers across all three datasets so they can be merged.
4. Merge into a single analysis-ready dataset. Report the merge diagnostics: how many rows survived, how many were lost, any unexpected patterns.

### Part B: Sample Construction & Descriptives

5. Construct your analysis sample: single mothers (female, unmarried, num_children > 0), aged 20-55, years 2015-2022. Report the sample size.
6. Create a balance table comparing treated states (EITC expansion) vs. control states in the pre-period (2015-2017). Include: age, education, num_children, employment rate, earnings. Are the groups balanced?
7. Plot employment rates over time for treated vs. control groups. Does parallel trends hold visually?

### Part C: Analysis

8. Estimate a difference-in-differences model:

   `employed = B0 + B1 * treated + B2 * post + B3 * (treated * post) + controls + state_FE + year_FE + e`

   Where post = 1 for years >= 2018. Include controls for age, education, and num_children. Cluster standard errors at the state level. Interpret B3.

9. Estimate the model with and without state-level economic controls (unemployment_rate, min_wage). Does the estimate change?

10. Produce a regression table with at least 3 specifications side by side.

### Part D: Visualization

11. Create at minimum:
    - (a) A parallel trends plot (treated vs. control employment over time)
    - (b) A coefficient plot or event-study plot if time permits
    - (c) One additional figure of your choosing

All figures must be publication-quality.

### Part E: Research Memo

12. Write a 1-2 page memo covering:
    - Research question and motivation
    - Data sources and sample construction
    - Empirical strategy and identification assumptions
    - Key results with magnitudes and significance
    - Limitations and threats to validity
    - One suggestion for further research

## Evaluation Criteria

This is an end-to-end simulation. You are evaluated on everything:

- **Code quality:** Clean, commented, no for-loops over rows, clear pipeline structure
- **Data cleaning judgment:** Reasonable decisions, documented, nothing silently dropped
- **Analysis:** Correct specification, proper standard errors, reasonable controls
- **Output quality:** Publication-ready tables and figures
- **Written communication:** The memo is the most important deliverable. It should be concise, data-driven, and demonstrate economic reasoning.
- **Time management:** Did you allocate time wisely? Did you finish?
