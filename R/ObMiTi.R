#' \code{ObMiTi} package
#'
#' Title: Ob/ob Mice Data on Normal and High Fat Diet
#' The package provide RNA-seq count for 2 strains of mus
#' musclus; Wild type and Ob/Ob. Each strain was divided
#' into two groups, and each group received either chow
#' diet or high fat diet. RNA expression was measured
#' after 12 weeks in 7 tissues.
#' @docType package
#' @name ObMiTi
#'
#' @details The dataset can be accessed through the
#' \code{ExperimentHub} as a \code{RangedSummarizedExperiment}
#' object contains:
#' \describe{
#' \item{assay}{The read counts \code{matrix}.}
#' \item{colData}{The phenotype data of the samples}
#' \item{rowRanges}{The feature data and annotation of the peaks.}
#' \item{metadata}{extra details about the sample and associated phenotype}
#' \code{studies}. This is a \code{data.frame} of bibliography information of
#' the studies from which the samples were collected for.}
#'
#' @import SummarizedExperiment
#' @import ExperimentHub
#'
#' @examples
#' \dontrun{
#' # load the data object
#' library(ExperimentHub)
#'
#' # query package resources on ExperimentHub
#' eh <- ExperimentHub()
#' query(eh, "ObMiTi")
#'
#' # load data from ExperimentHub
#' ob_counts <- query(eh, "ObMiTi")[[1]]
#'
#' # print object
#' ob_counts
#' }
NULL
