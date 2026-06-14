---
author: Callaway, Brantly; Sant'Anna, Pedro
year: 2020
title: Difference-in-Differences with Multiple Time Periods
methodology: Staggered DiD
tags: [DiD, panel-data, identification, causal-inference]
added: 2026-05-23
---

# Callaway & Sant'Anna 2020 — Staggered DiD

**Identification:** Treatment timing is heterogeneous across units. The canonical $2\times 2$ DiD estimator is biased in a staggered setting when previously-treated units are used as controls for later shocks. CS resolves this by grouping by cohort (first-treatment time $g$) and calendar time $t$, and estimating $ATT(g, t)$ — the average treatment effect at calendar time $t$ for the cohort first treated at $g$ — using only never-treated or not-yet-treated units as controls.

**Methodology:** Group-time average treatment effects $ATT(g, t)$, aggregated up to event-study or overall ATT estimands. Assumption 1: irreversibility of treatment; Assumption 2: random sampling iid. The ATT causal parameter is called the *group-time average treatment effect*. Assumption 3: limited treatment anticipation; Assumption 4: Conditional Parallel Trends based on a "never-treated group"; Assumption 5: conditional parallel trend based on "not-yet-treated" groups. Assumption 4 and 5 are the keystones of staggered DiD when dealing with multiple time periods and multiple treatment groups. Assumption 6: Overlap. 

**Key insight:** The classical two-way fixed-effects regression collapses everything into one number and, under heterogeneous treatment effects, mixes early-treated units into the control group for later cohorts — producing negative weights and possibly sign-flipped estimates. CS sidesteps this by never using already-treated units as controls.
Conditional DiD allows the parallel trends to be more plausible when covariates such as age, employment, education are endogenous. 
Example: The effect of minimum wage policy on teen employment. 

**Relevance to my research:** Applicable in any policy-evaluation setting with staggered adoption — e.g., staggered legalization of online gambling, paid maternity leave programs, Medicaid expansions, or any rollout-style health shock.

**Related:** [[athey-2015_causal-forest]]
