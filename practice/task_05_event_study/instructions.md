# Task 5: Event Study with Time-Series Data

**Difficulty:** Intermediate-Advanced
**Target time:** 4 hours
**Skills tested:** Datetime manipulation, event windows, regression in loops, event-study visualization
**Recommended week:** 5-6

---

## Background

A consumer advocacy group wants to understand how product recall announcements affect online consumer engagement. You have daily data on product reviews and engagement metrics for an e-commerce platform. You will investigate whether major recall events cause measurable shifts in consumer behavior.

This task is modeled after the style of the 2022 PRE Workshop coding exercise (Part 2), which asked applicants to build a daily panel and estimate event-driven regressions across multiple events and outcomes.

## Data

This task uses **synthetic data** generated in the notebook's setup cell. The dataset simulates:

- Daily observations from January 1, 2019 to December 31, 2022 (1,461 days)
- Variables: date, num_reviews, avg_rating, num_complaints, response_time_hrs, negative_review_share
- Three recall events at known dates:
  - **Event A:** March 15, 2020 (major recall)
  - **Event B:** August 22, 2021 (moderate recall)
  - **Event C:** January 10, 2022 (minor recall)

## Questions

### Part A: Data Preparation (30 min)

1. Load the data. Convert the date column to datetime format. Verify there are no gaps in the daily time series.
2. Create a summary statistics table for all numeric variables.
3. Plot the full time series for each of the 5 outcome variables. Mark the three recall events with vertical lines. Do you see any obvious visual patterns around the events?

### Part B: Panel Construction (30 min)

4. For each of the 3 events, create a 60-day window: 30 days before and 30 days after the event date.
5. Create a `post` indicator variable that equals 0 in the pre-event window and 1 in the post-event window.
6. Stack the three event windows into a single panel with an `event_id` column identifying which event each observation belongs to. Report the final panel dimensions.

### Part C: Event-Driven Regressions (60 min)

7. For each event and each outcome variable, estimate the following regression:

   `Y_t = B0 + B1 * post_t + e_t`

   This gives you 3 events x 5 outcomes = 15 regressions.

8. Organize results into a table: rows = outcome variables, columns = events. Each cell shows the coefficient on `post` with its standard error in parentheses. Star significant coefficients at the 5% level.

9. Interpret the coefficients. What does B0 represent? What does B1 represent? Which event-outcome pairs show statistically significant changes?

### Part D: Event-Study Visualization (45 min)

10. For the outcome variable that shows the strongest response to Event A, create a daily-level event-study plot:
    - x-axis: days relative to Event A (day -30 to day +30)
    - y-axis: residualized outcome (after removing day-of-week effects)
    - Add a vertical line at day 0 and a horizontal line at the pre-event mean

11. Create a 3x1 panel figure showing the same outcome variable around all three events side by side.

12. Discuss: do the magnitudes and timing of the effects differ across events? Why might this be?

### Part E: Extensions (30 min)

13. Add day-of-week fixed effects to your regressions. Do the results change? Why might day-of-week matter?

14. Estimate a version with a linear time trend in the pre-period extended through the post-period. Does the treatment effect estimate change when you account for trends?

### Part F: Write-Up (25 min)

15. Write a 1-page memo: research question, methodology, key results (with numbers), and what you would do with more time/data.

## Evaluation Criteria

- The regression loop is clean and efficient (not 15 copy-pasted blocks)
- The results table is formatted for presentation
- Event-study plots have proper formatting (vertical event line, CI bands, clean axes)
- The memo distinguishes between statistically significant and economically meaningful results
