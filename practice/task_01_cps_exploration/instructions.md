# Task 1: CPS Data Exploration & Cleaning

**Difficulty:** Introductory
**Target time:** 2 hours
**Skills tested:** Data loading, assessment, cleaning, groupby, visualization
**Recommended week:** 1-2

---

## Background

The Current Population Survey (CPS) is the primary source of labor force statistics in the United States, conducted monthly by the Bureau of Labor Statistics and the Census Bureau. You will work with CPS microdata to explore labor market patterns.

## Data

Use the CPS public-use microdata. You can either:
- Use the existing file at `../../data/clean_nov25pub.csv` (already cleaned CPS November 2025)
- Or download a fresh extract from [IPUMS CPS](https://cps.ipums.org/cps/) and place it in `data/`

## Questions

### Part A: Data Assessment (30 min)

1. Load the dataset and report: number of observations, number of variables, data types, and memory usage.
2. What is the unit of observation? (Individual? Household? Person-month?)
3. Identify and report the extent of missing values across all variables. Which variables have the most missingness? Is the missingness likely random or systematic?
4. Are there any variables that appear to have incorrect data types (e.g., numeric codes stored as strings)?

### Part B: Summary Statistics (30 min)

5. Compute summary statistics (mean, median, standard deviation, min, max) for key labor market variables: employment status, hours worked, earnings.
6. Break down employment rates by: (a) age group, (b) education level, (c) sex. Present results in a single clean summary table.
7. What is the distribution of weekly hours worked among employed persons? Create a histogram.

### Part C: Exploratory Analysis (45 min)

8. Create a figure showing how earnings vary by education level. Choose an appropriate plot type and justify your choice.
9. Create a figure showing the relationship between age and earnings. Does the relationship appear linear?
10. Pick one pattern you found interesting in the data. Describe it in 2-3 sentences and suggest a possible explanation.

### Part D: Write-Up (15 min)

11. Write a 1-page memo summarizing what you found. Structure it as: data description, key findings (with specific numbers), limitations of the analysis.

## Evaluation Criteria

- Code is clean, commented, and uses vectorized pandas operations (no for-loops over rows)
- Figures are properly labeled with titles, axis labels, and legends
- Summary tables are formatted and easy to read
- The memo is concise and data-driven
