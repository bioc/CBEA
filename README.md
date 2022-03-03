
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `CBEA`: Taxonomic Enrichment Analysis in R <img src='man/figures/hex-CBEA.png' align="right" height="110" />

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/qpmnguyen/CBEA/branch/master/graph/badge.svg)](https://codecov.io/gh/qpmnguyen/CBEA?branch=master)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![R-CMD-check](https://github.com/qpmnguyen/CBEA/workflows/R-CMD-check-bioc/badge.svg)](https://github.com/qpmnguyen/CBEA/actions)
<!-- [![BioC status](http://www.bioconductor.org/shields/build/release/bioc/CBEA.svg)](https://bioconductor.org/checkResults/release/bioc-LATEST/CBEA) -->
<!-- badges: end -->

### Quang Nguyen

The `CBEA` package provides basic functionality to perform taxonomic
enrichment analysis in R. This package mainly supports the `CBEA`
method, and provides additional support for generating sets for analyses
using approaches commonly used in the gene set testing literature.

### Installation

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("qpmnguyen/CBEA")
```

### Features

This package implements the CBEA approach for performing set-based
enrichment analysis for microbiome relative abundance data. A preprint
of the package can be found [on bioXriv](https://www.biorxiv.org/content/10.1101/2021.09.07.459294v1.full). In summary, CBEA (Competitive Balances for taxonomic Enrichment Analysis) provides an estimate of the activity of a set by transforming an input taxa-by-sample data matrix into a corresponding set-by-sample data matrix. The resulting output can be used for additional downstream analyses such as differential abundance, classification, clustering, etc. using set-based features instead of the original units.

The transformation that CBEA applies is based on the isometric log ratio transformation:  

$$
CBEA_{i,\mathbb{S}} = \sqrt{\frac{|\mathbb{S}||\mathbb{S_c}|}{|\mathbb{S}| + |\mathbb{S_c}|}} \ln \frac{g(X_{i,j | j\in \mathbb{S}})}{g(X_{i,j | j \notin \mathbb{S}})}
$$

Where $\mathbb{S}$ is the set of interest, $\mathbb{S}_C$ is it's complement, $g()$ is the geometric mean operation, and $X$ is the original data matrix where $i$ is the index representing samples and $j$ is the index representing variables (or taxa).   

The inference procedure is performed through estimating the null distribution of the test statistic. This can be done either via permutations or a parametric fit of a distributional form on the permuted scores. Users can also adjust for variance inflation due to inter-taxa correlation. Please refer to the main manuscript for any additional details. 
