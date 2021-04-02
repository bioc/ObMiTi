
metadata <- data.frame(
                      BiocVersion= "3.13",
                      SourceUrl="https://github.com/OmarAshkar/ObMiTi",
                      SourceType= "GSEMatrix",
                      SourceVersion= "Feburary 7 2021",
                      #SourceLastModifiedDate="Feburary 7 2021",
                      #SourceMd5=NA_character_,
                      #SourceSize=NA_real_,
                      DataProvider= "Gyeongsang National University",
                      Title= "Ob/ob and WT mice transcriptome sequencing",
                      Description= "Leptin deficient mice is an appealing model for studying of metabolic syndromes. In this data, we provide 7 different tissues’ RNA-seq reads for each leptin-deficient mice (ob/ob) and wild type mice.",
                      Maintainer= "Omar Elashkar <omar.i.elashkar@gmail.com>",
                      Species= "Mus musculus",
                      TaxonomyId=10090,
                      Genome= "mm10",
                      #Tags=NA_character_,
                      RDataClass = "SummarizedExperiment",
                      #RDataDateAdded=as.POSIXct(NA_character_),
                      RDataPath="ObMiTi/ob_counts.rds",
                      Coordinate_1_based=TRUE,
                      #Notes=NA_character_,
                      DispatchClass= "Rds"
                      #PreparerClass=NA_character_,
                      #Location_Prefix='http://s3.amazonaws.com/annotation-contributor/ObMiTi/'
)

write.csv(metadata, "inst/extdata/metadata.csv", quote = TRUE,   row.names =FALSE)
