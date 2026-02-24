# Task 2: Wage Regression & Interpretation

**Difficulty:** Intermediate
**Target time:** 3 hours
**Skills tested:** OLS regression, statsmodels, coefficient interpretation, regression tables, identification reasoning
**Recommended week:** 3-4

---

## Background

One of the most studied questions in labor economics is the returns to education: how much does an additional year of schooling increase earnings? You will estimate a Mincerian wage equation using CPS data and critically assess the results.

## Data

Use CPS microdata (same source as Task 1). Restrict your sample to employed individuals aged 25-64 with positive earnings.

Place data in `data/` or reference the shared data folder.

## Questions

### Part A: Sample Construction (30 min)

1. Load the data and construct your analysis sample. Document every restriction you apply and why (e.g., dropping observations with zero earnings, restricting age range).
2. Create an education variable suitable for regression. If education is coded categorically, decide how to handle it (continuous years? dummy variables?) and justify your choice.
3. Report sample sizes before and after each restriction. How much data did you lose?

### Part B: Descriptive Analysis (30 min)

4. Produce a table of mean earnings by education category. Include standard deviations and sample sizes.
5. Create a scatter plot (or binned scatter) of log earnings vs. years of education. Does the relationship look approximately linear?
6. Examine the distribution of log earnings. Is it approximately normal? Does this matter for OLS?

### Part C: Regression Analysis (60 min)

7. Estimate the following Mincerian wage equation using OLS:

   `log(earnings) = B0 + B1 * education + B2 * experience + B3 * experience^2 + e`

   Where experience = age - education - 6 (potential experience). Report and interpret all coefficients.

8. Add controls for sex, race, and region. How do the education coefficients change? Why might they change?

9. Estimate the model separately for men and women. Test whether the returns to education differ by sex.

10. Produce a single publication-quality regression table showing all three specifications side by side (columns: baseline, with controls, by sex). Include standard errors, R-squared, and sample sizes.

### Part D: Identification Discussion (30 min)

11. What is the key identification concern with interpreting the education coefficient as causal? Name at least two potential sources of omitted variable bias.

12. If a researcher wanted to estimate the causal effect of education on earnings, what identification strategy might they use? Briefly describe one approach (e.g., IV using compulsory schooling laws) and its key assumption.

### Part E: Write-Up (30 min)

13. Write a 1-page research memo covering: research question, data and methods, key findings (with specific coefficient estimates and their interpretation), and limitations.

## Evaluation Criteria

- Regression table is formatted for publication (not raw statsmodels output)
- Coefficients are interpreted correctly (especially the log-level relationship)
- Identification concerns are discussed thoughtfully
- Code is organized as a clear pipeline: load -> clean -> analyze -> present
