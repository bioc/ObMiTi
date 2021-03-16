# ObMiTi

A  MusMus Dataset of Ob/ob and WT mice on different diets.

# Overview

In this document, we introduce the purpose of `ObMiTi` package,
its contents and its potential use cases. This package is a dataset of RNA-seq samples. The samples are of
6 ob/ob mice and 6 wild type mice divided further into High 
fat diet and normal diet. From each mice 7 tissues has been analyzed. The duration of dieting was 12 weeks.

The package document the data collection, pre-processing and 
processing. In addition to the documentation the package contains the scripts
that were used to generate the data in `inst/scripts` and access to the final
`RangedSummarizedExperiment` object through `ExperimentHub`.

# Introduction

## What is `ObMiTi`?

It is an R package for documenting and distributing a  dataset. The 
package doesn't contain any R functions.

## What is contained in `ObMiTi`?

The package contains two different things:

1. Scripts for documenting/reproducing the data in `inst/scripts`
2. Access to the final `RangedSummarizedExperiment` through `ExperimentHub`.

## What is `ObMiTi` for?

The `RangedSummarizedExperiment` object contains the `counts`, `colData`,
`rowRanges` and `metadata` which can be used for the purposes of 
differential gene expression and get set enrichment analysis.

# Installation

The `ObMiTi` package can be installed from Bioconductor using 
`BiocManager`.

```{r install_biocmanager,eval=FALSE}
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("ObMiTi")
```


## Exploring the `ob_counts` object

In this section, we conduct a simple exploration of the data objects to show 
the content of the package and how they can be loaded and used.

```
# loading required libraries
library(ExperimentHub)
library(SummarizedExperiment)
library(dplyr)
```



```{r loading_data}
# query package resources on ExperimentHub
eh <- ExperimentHub()
query(eh, "ObMiTi")

# load data from ExperimentHub
ob_counts <- query(eh, "ObMiTi")[[1]] 

# print object
ob_counts
```


# Citing `ObMiTi`
For citing the package use:

```
#citing the package
citation("ObMiTi")
```
