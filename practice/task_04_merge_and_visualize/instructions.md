# Task 4: Multi-Dataset Merge & Visualization

**Difficulty:** Intermediate
**Target time:** 3 hours
**Skills tested:** Merging datasets, handling merge issues, constructing composite measures, multi-panel figures
**Recommended week:** 3-4

---

## Background

You are preparing a briefing for a research team studying regional economic inequality in the United States. You have three separate data sources that need to be combined into a single analysis-ready dataset. Your goal is to merge them cleanly, construct a meaningful composite measure, and produce visualizations that tell a clear story.

This task is modeled after the style of the 2022 PRE Workshop coding exercise (Part 1).

## Data

This task uses **synthetic data** that you will generate in the notebook's setup cell. The generated datasets simulate:

1. **county_economics.csv** — County-level economic indicators: median_income, unemployment_rate, poverty_rate, population. ~3,200 rows (one per county). FIPS codes as identifiers.

2. **county_education.csv** — County-level education data: pct_bachelors, pct_no_highschool, pct_graduate. Same counties but stored in long format (county_fips, measure, value). Some counties have missing values.

3. **county_geography.csv** — State names, region (Northeast, South, Midwest, West), and county names. Has a few counties not present in the other datasets, and uses slightly different FIPS formatting (with leading zeros stripped in some rows).

## Questions

### Part A: Data Loading & Assessment (20 min)

1. Load all three datasets. For each, report: number of rows, number of columns, data types, and extent of missing values.
2. What is the key variable you will merge on? Are there any formatting inconsistencies across datasets (e.g., string vs. integer FIPS codes, leading zeros)?

### Part B: Merging (40 min)

3. Merge the three datasets into a single county-level DataFrame. Document your merge strategy:
   - What type of join did you use and why?
   - How many rows survived vs. were dropped?
   - Did any counties appear in one dataset but not others?

4. Reshape the education data from long to wide format before or during the merge. Show how you handle this.

5. After merging, validate the result: check for duplicates, unexpected nulls introduced by the merge, and row counts.

### Part C: Composite Measure (30 min)

6. Construct a county-level **economic hardship index** using at least 3 variables from your merged dataset. Justify your choice of components and how you combine them (simple average of z-scores? weighted? PCA?).

7. Report summary statistics for your index by region. Which region has the highest average economic hardship?

### Part D: Visualization (45 min)

8. Create a 2x2 panel figure (4 subplots) showing:
   - (a) Distribution of your hardship index (histogram or KDE)
   - (b) Hardship index by region (box plot or violin plot)
   - (c) Scatter plot of hardship index vs. median income
   - (d) Scatter plot of hardship index vs. pct_bachelors

   All panels should share consistent styling, with proper titles, labels, and a main figure title.

9. Create one additional figure of your choosing that reveals an interesting pattern in the data. Explain what it shows.

### Part E: Write-Up (25 min)

10. Write a 1-page memo for the research team summarizing: data sources and merge approach, your hardship measure and rationale, key findings from your visualizations, and limitations.

## Evaluation Criteria

- Merge issues are handled explicitly (not silently dropped)
- The composite measure is justified, not arbitrary
- The 2x2 figure is publication-quality with consistent styling
- The memo is written for a non-technical audience (the research team, not a coder)
