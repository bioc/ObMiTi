# load required libraries
library(GEOquery)
library(readr)
library(purrr)
library(biomaRt)
library(GenomicRanges)
library(SummarizedExperiment)

# download supplementary files from geo (GSE167264) ----
getGEOSuppFiles('GSE167264', baseDir = 'inst/')

# make eset object based on geo record ----
es <- getGEO('GSE167264', destdir = 'inst/')[[1]]
pd <- pData(es)
colnames(pd) <- make.names(colnames(pd))

# make se object tables
## counts matrix ----
counts_file <- 'inst/GSE167264/GSE167264_Ob_Mus_RNA_seq_counts.txt.gz'
file.exists(counts_file)

counts <- read.delim(counts_file, skip = 1)

mat <- as.matrix(dplyr::select(counts, ends_with('.bam')))

rownames(mat) <- counts$Geneid

colnames(mat) <- sub('\\.bam', '', colnames(mat))
colnames(mat) <- es$geo_accession[match(es$title, colnames(mat))]

## features data ----
### get gene info from ensemble
ens_mart <- useMart('ensembl')
ens_mm10 <- useMart(biomart = 'ensembl',
                    dataset = 'mmusculus_gene_ensembl')

ens_df <- getBM(
    attributes = c('ensembl_gene_id',
                   'chromosome_name',
                   'start_position',
                   'end_position',
                   'strand',
                   'entrezgene_id',
                   'mgi_symbol',
                   'gene_biotype'),
    mart = ens_mm10
)

### subset to available ids
mat2 <- mat[intersect(rownames(mat), ens_df$ensembl_gene_id),]

### make gr object
gr <- ens_df[match(rownames(mat2), ens_df$ensembl_gene_id),]

gr$strand <- ifelse(gr$strand == 1, '+', '-')
names(gr) <- c('gene_id', 'seqnames', 'start', 'end', 'strand',
               'entrez_id', 'symbol', 'biotype')

row_ranges <- makeGRangesFromDataFrame(gr, keep.extra.columns = TRUE)

names(row_ranges) <- row_ranges$gene_id

all(rownames(mat2) == names(row_ranges))

## metadata ----
measure_files <- list.files('inst/GSE167264',
                            pattern = '*.tsv.gz',
                            full.names = TRUE)
all(file.exists(measure_files))

measures <- map(measure_files, read.delim)
measures <- Reduce('merge', measures)

# make an se object ----
se <- SummarizedExperiment(assays = list(counts = mat2),
                           colData = pd,
                           rowRanges = row_ranges,
                           metadata = list(measures = measures))

# write to file ----
write_rds(se, 'ob_counts.rds')
