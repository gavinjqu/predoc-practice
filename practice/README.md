# Predoc Coding Task Practice

6 progressive practice tasks designed to mirror real predoc coding assessments. Each task has instructions, a pre-structured Python notebook, and a data folder.

## How to Use

1. Read `instructions.md` for the task prompt and questions
2. Open `task.ipynb` and work through the sections
3. Time yourself — stick to the target time
4. Always write the interpretation memo at the end (this is what evaluators care about most after code quality)
5. Review your output: are your tables and figures clean enough to show a professor?

## Skill Progression

| Task | Topic | Skills | Target Time | Recommended Week |
|------|-------|--------|-------------|-----------------|
| 01 | CPS Data Exploration | pandas basics, cleaning, groupby, visualization | 2 hrs | Week 1-2 |
| 02 | Wage Regression | OLS, statsmodels, coefficient interpretation, regression tables | 3 hrs | Week 3-4 |
| 03 | Panel Data & DiD | panel construction, fixed effects, DiD, event-study plots | 4 hrs | Week 5-6 |
| 04 | Multi-Dataset Merge | merging on keys, composite measures, multi-panel figures | 3 hrs | Week 3-4 |
| 05 | Event Study | datetime ops, event windows, regression loops, event-study viz | 4 hrs | Week 5-6 |
| 06 | Full Simulation | end-to-end pipeline: clean, analyze, visualize, memo | 5-6 hrs | Week 7-8 |

## What Evaluators Actually Care About

From predoc hiring committees and evaluator feedback:

1. **Good habits & judgment** — Clean, readable code. Reasonable decisions about data quirks. Comment your reasoning.
2. **Communication of results** — Clear tables and figures. Many candidates fail here. Don't clutter your output.
3. **Economic intuition** — Correct identification strategy. Know causal vs. predictive.
4. **Simplicity** — "Don't try to show off advanced techniques. Show off simplicity rather than complexity."
5. **The write-up matters** — Describe what you did and why. Present statistical results. Give economic interpretation.

## Notebook Template

Each `task.ipynb` follows this structure:
1. **Setup** — imports, plot style, data paths
2. **Data Loading & Assessment** — first look at the data
3. **Data Cleaning & Preparation** — documented cleaning decisions
4. **Analysis** — core analytical work
5. **Visualization** — publication-quality figures
6. **Results Summary** — formatted tables
7. **Written Interpretation** — the memo

A standalone `template.ipynb` is provided for use with any dataset or task.

## Reference Resources

- [predoc.org sample data tasks](https://www.predoc.org/how-to-prepare)
- [Econ RA Guide coding example](https://raguide.github.io/appendix/coding_example)
- [Princeton ESOC Training (GitHub)](https://github.com/esoclabprinceton/ESOC-Predoc-Training)
- [Causal Inference for the Brave and True](https://matheusfacure.github.io/python-causality-handbook/landing-page.html)
- [QuantEcon Python lectures](https://python-programming.quantecon.org/intro.html)
- [Using Python for Introductory Econometrics (free PDF)](https://www.urfie.net/downloads/PDF/UPfIE_web.pdf)
