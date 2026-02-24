# Economics Pre-doctoral Researcher Position Guide

## What is predoc?
What is a Pre-Doc?
A Pre-Doc is a 1-2 year position where you work closely with a professor or research team
as a full-time research assistant. The position is an increasingly important steppingstone to
grad school for those interested in pursuing a PhD in the economics. It is targeted at recent undergraduates, graduate students, and young professionals who want to transition into academia. For myself specifically, it is an opportunity to make myself more attractive to grad schools, gain valuable skills through mentorship, and receive a recommendation letter from someone in the top of my field. 

## Resources
1. Predoc.org
2. www.nber.org/career-resources/research-assistant-positions-not-nber
3. https://raguide.github.io/appendix/coding_example
4. https://medium.com/@jesitaa/cracking-the-code-your-step-by-step-pre-doctoral-guide-in-economics-198cb554a03c
5. Chicago BFI
6. EconJobMarket.org
7. https://www.predoc.org/how-to-prepare

---

## What Predoc Coding Tasks Look Like

Most predoc positions ask applicants to complete a **data task** to demonstrate quantitative abilities. Based on research from predoc.org, Econ RA Guide, and evaluator feedback:

**Format:**
- You receive a dataset (often messy, not in a helpful format) + a research question
- **Two parts:** (1) data manipulation/cleaning, (2) short research write-up using the data
- Time window: **3-24 hours** depending on the program (take-home or timed)
- Language-agnostic: Python, R, and Stata are all accepted. The precise language matters less than strong coding fundamentals.

**Typical task structure (based on real PRE Workshop and predoc tasks):**
- Load and explore unfamiliar data
- Clean, merge, and reshape datasets
- Compute summary statistics and construct new variables
- Run regressions and interpret results
- Produce publication-quality figures and tables
- Write a concise memo explaining your approach and findings

---

## What Evaluators Care About

From evaluator feedback (econjobrumors, predoc.org, Econ RA Guide):

1. **Good habits & judgment** — Clean, readable code. Reasonable decisions about data quirks. Comment well.
2. **Communication of results** — Clear tables, figures, and written interpretation. Many candidates fail here. Don't clutter your output.
3. **Economic intuition** — Correct identification strategy. Understand causal vs. predictive claims.
4. **Simplicity over complexity** — "Don't try to show off advanced techniques if they aren't necessary. We're looking for good habits and judgment: code that is easy to read, reasonable ways of dealing with the data's idiosyncrasies."
5. **Data visualization** — Publication-quality, properly labeled, not cluttered.

**Key insight:** "The data task is a box to check rather than a place to stand out. Don't put yourself at risk of messing it up."

**For the write-up:** First describe what you did with appropriate reasoning (e.g., if you used fixed effects, say so and explain why). Present output with statistical interpretation. Finish with economic interpretation.

---

## Critical Skills (Python)

### Tier 1: Must-Have (every task)
- **pandas fluency**: groupby + agg, merge/join, pivot/melt, .assign()/.pipe() chaining, vectorized operations (no for-loops)
- **Data cleaning**: missing value handling (know when to drop vs. impute), outlier detection, datetime logic, categorical encoding
- **OLS with statsmodels**: fit model, interpret summary output (coefficients, p-values, R-squared, standard errors), residual diagnostics
- **Publication-quality output**: matplotlib/seaborn figures with labels, titles, legends; formatted regression tables with footnotes
- **Written interpretation**: describe methodology, present results, give economic meaning

### Tier 2: Frequently Tested
- **Difference-in-differences**: setup, parallel trends check, event-study plots
- **Instrumental variables**: relevance, exclusion restriction, 2SLS with linearmodels
- **Fixed effects**: panel data, entity/time FE, clustered standard errors
- **Hypothesis testing**: t-tests, chi-squared, confidence intervals, bootstrap

### Tier 3: Occasionally Tested
- Regression discontinuity design
- Synthetic control
- Basic ML: train/test split, cross-validation, regularization (know the distinction from causal inference)

---

## Practice Resources

### Practice Tasks
- [predoc.org — How to Prepare](https://www.predoc.org/how-to-prepare) — Sample data tasks with solutions, longer than typical to practice more skills
- [Econ RA Guide — Coding Example](https://raguide.github.io/appendix/coding_example) — Practice task: devise an empirical strategy for a causal question
- [Princeton ESOC Predoc Training (GitHub)](https://github.com/esoclabprinceton/ESOC-Predoc-Training) — Full 10-week public curriculum: data cleaning, regressions, causal inference, NLP, geospatial
- [PRE Workshop Recordings 2024](https://www.predoc.org/pre-workshop/pre-workshop-recordings-2024) — Video walkthroughs of data tasks
- [PRE Workshop Recordings 2023](https://www.predoc.org/pre-workshop/pre-workshop-recordings-2023) — Additional video solutions

### Learning Resources
- [Causal Inference for the Brave and True](https://matheusfacure.github.io/python-causality-handbook/landing-page.html) — Free Python-native causal inference textbook (RCTs, regression, IV, DiD, synthetic control)
- [QuantEcon — Python Programming for Economics](https://python-programming.quantecon.org/intro.html) — Sargent & Stachurski lectures; strong pandas/numpy coverage
- [Using Python for Introductory Econometrics (free PDF)](https://www.urfie.net/downloads/PDF/UPfIE_web.pdf) — Florian Heiss; Python translation of Wooldridge exercises
- [Econ RA Guide — Technical Skills](https://raguide.github.io/reqs/tech) — Overview of required/recommended skills for RA positions

### Community
- [EconJobRumors: "How to do well on predoc data tasks"](https://www.econjobrumors.com/topic/how-to-do-well-on-predoc-data-tasks) — Evaluator perspectives
- [Econ RA Guide](https://raguide.github.io/) — Community guide covering applications, skills, examples

---

## Gaps in Current 8-Week Plan

Based on research, the `strategy_updated.md` plan covers technical concepts well but has these gaps:

1. **Real predoc-format practice** — Plan is concept-heavy but lacks timed practice on actual predoc-style data tasks. Integrate sample tasks from predoc.org and the Econ RA Guide starting from Week 3.
2. **Output quality** — Evaluators emphasize that many candidates fail on presentation. Need dedicated drills on publication-quality tables, clean figures, and formatted regression output.
3. **Written communication** — Every practice session should end with a 1-page write-up: what you did, why, and what the results mean. This is tested explicitly.
4. **Timed simulations earlier** — Start timed drills at Week 4-5, not just Week 8. The 3-6 hour take-home format needs muscle memory.
5. **Practice tasks available** — See `practice/` folder for 6 progressive tasks mapped to the 8-week plan.
