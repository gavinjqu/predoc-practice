# Task 3: Panel Data & Difference-in-Differences

**Difficulty:** Intermediate-Advanced
**Target time:** 4 hours
**Skills tested:** Panel data construction, fixed effects, DiD estimation, parallel trends, event-study plots
**Recommended week:** 5-6

---

## Background

A state enacted a minimum wage increase on January 1, 2020, raising it from $7.25 to $10.00. You will use synthetic panel data to estimate the effect of this policy on employment in the restaurant industry, using a difference-in-differences design.

## Data

This task uses **synthetic data** that you will generate in the notebook's setup cell. The data generation code is provided so you can focus on analysis, not data collection. The generated dataset simulates:
- 50 states observed quarterly from 2017-Q1 to 2022-Q4 (24 quarters)
- 10 states are "treated" (enacted the policy), 40 are "control"
- Variables: state_id, quarter, treated, post, employment, population, avg_wage, restaurant_share

## Questions

### Part A: Data Setup & Exploration (30 min)

1. Run the data generation cell. Verify the structure: how many states, time periods, treated vs. control?
2. Produce a summary statistics table comparing treated and control states in the pre-period (before 2020-Q1). Are the groups balanced on observables?
3. Plot the average employment trend for treated vs. control states over time. Does the parallel trends assumption appear plausible visually?

### Part B: Difference-in-Differences (60 min)

4. Estimate the basic 2x2 DiD model:

   `employment = B0 + B1 * treated + B2 * post + B3 * (treated * post) + e`

   Interpret each coefficient. What is the estimated treatment effect?

5. Now estimate the same model with state and time fixed effects:

   `employment = state_FE + quarter_FE + B * (treated * post) + e`

   How does the estimate change? Why might it differ from the 2x2 model?

6. Add controls for population and restaurant_share. Does the estimate change meaningfully?

7. Cluster standard errors at the state level. How do standard errors compare to the unclustered version? Why is clustering important here?

### Part C: Parallel Trends & Event Study (60 min)

8. Formally test the parallel trends assumption by estimating an event-study specification. Interact the treatment indicator with dummies for each quarter relative to treatment (omitting the period just before treatment, e.g., 2019-Q4):

   `employment = state_FE + quarter_FE + sum(B_k * treated * 1[relative_quarter = k]) + e`

9. Plot the event-study coefficients with 95% confidence intervals. Are the pre-treatment coefficients statistically different from zero? What does this tell you?

10. Discuss: what would you conclude if the pre-treatment coefficients showed a trend?

### Part D: Robustness (30 min)

11. Run a placebo test: pretend the policy was enacted on January 1, 2019 instead. Re-estimate the DiD model on pre-2020 data only. Do you find a significant "effect"?

12. Discuss one additional robustness check you would perform if you had more data or time.

### Part E: Write-Up (30 min)

13. Write a 1-page memo: research question, identification strategy, key results (with magnitudes and significance), and threats to validity.

## Evaluation Criteria

- Event-study plot is properly formatted with confidence intervals and a vertical line at treatment
- Standard errors are correctly clustered
- Parallel trends assumption is explicitly discussed
- The memo demonstrates understanding of when DiD does and does not identify causal effects
