---
author: Athey, Susan; Imbens, Guido
year: 2015
title: Recursive Partitioning for Heterogeneous Causal Effects (Causal Forests)
methodology: Causal forests / ML for causal inference
tags: [causal-inference, machine-learning, heterogeneous-treatment-effects]
added: 2026-05-23
---

# Athey 2015 — Causal Forest

**Identification:** Adapts the random-forest algorithm so that splits are chosen to maximize heterogeneity in treatment effects rather than predictive accuracy. Two forests are constructed (honest splitting / estimation samples) to form valid counterfactual estimates with asymptotic normality.

**Methodology:** Modification of CART to construct causal forests usable for valid statistical inference on conditional average treatment effects (CATEs).

**Key insight:** An algorithmic approach to using random forests as *statistical inference* instruments to identify heterogeneous treatment effects — not just to predict outcomes.

**Relevance to my research:** ML methods for causal inference are the frontier of applied methods research. Pairs directly with Athey 2019's high-level framing of why ML alone is not enough.

**Related:** [[athey-2019_causal-vs-ml]], [[callaway-santanna-2020_staggered-did]]
