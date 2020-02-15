---
documentclass: article
title: Calculating lifetime cancer risk in a population
author: Karl Pettersson
lang: en
---

# Introduction

It is common to hear statements such as "one in three persons will develop
cancer during their lifetime", "one in nine women will develop breast cancer"
and so on. Most often, such statements are based on a simple calculation of
cumulative risk, i.e.\ age-specific incidence rates for a given year and cancer
diagnosis are summed up to a chosen maximum age, e.g.\ 75 years, and the resulting
cumulative incidence rate $r$ is then converted into a probability using the
formula $1-\exp(-r)$. However, if "lifetime cancer risk" is interpreted as the
proportion of the population which will be diagnosed with cancer during their
lifetime, this method gives incorrect results, because it does not take the
following into account:

* Future changes in cancer rates.
* People who die before they reach the maximum age, due to causes unrelated to cancer.
* People who develop cancer at ages above the maximum age.
* People who are diagnosed with multiple primary cancers during their
   lifetime.
