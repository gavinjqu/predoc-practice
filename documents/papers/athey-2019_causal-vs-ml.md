---
author: Athey, Susan
year: 2019
title: Causal Inference vs. Machine Learning
methodology: Meta-analysis
tags: [causal-inference, machine-learning, methodology]
added: 2026-05-23
---

# Athey 2019 — Causal Inference vs. ML

**Identification:** Conceptual / meta-analysis comparing predictive ML objectives ($R^2$, MSE) with causal objectives (unbiased $\hat{\beta}$).

**Methodology:** Meta-analysis surveying where ML and causal methods diverge.

**Key insight:** The hotel pricing example — causality matters when you regress demand on price. An increase in price often appears to be correlated with an increase in demand (selection bias: yield-management software sets price driven by seasonal demand). An ML model will perfectly predict that pattern, but we cannot draw any sensible causal claim from it.

**Relevance to my research:** Fundamental difference between econ and data science. Sets up why ML-for-causal-inference (e.g., causal forests, double ML) is a distinct research program rather than "just regression with more flexible functional forms."

**Related:** [[athey-2015_causal-forest]]
