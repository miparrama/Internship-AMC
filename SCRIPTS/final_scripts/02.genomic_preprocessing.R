
### Preprocessing of genomic data. 


library ("tidyverse")
library ("bigsnpr")
library ("tnse")



#SNP files before performing imputation (here no new variables are needed). 
#Plink2 files were transformed into Plink1 files first. 
bedfile = "DATA/genomics/pgen_qc/genotypes_qc_plink1.bed"

#Loading the files
snp_readBed (bedfile = bedfile, backingfile = "DATA/genomics/backup_bigSNPr/genotypes_qc")

snp_array = snp_attach ("DATA/genomics/backup_bigSNPr/genotypes_qc.rds")



counts = big_counts(snp_array$genotypes)

#Delete snps with more than 6 missing values (more than 1 percent of the patients with missing values)
good_snps = which (counts[4,] < 7) 

snp_array_filtered = snp_subset(snp_array, ind.col = good_snps)
snp_array = snp_attach (snp_array_filtered)


G = snp_array$genotypes 

#Imputations of the remaining missing values again. (Necessary for the following step)
G = snp_fastImputeSimple(G, method = "mode")

# Exclude Long-Range Linkage Disequilibrium Regions of the human genome
# based on an online table. 
ind.excl <- snp_indLRLDR(infos.chr = snp_array$map$chromosome, infos.pos = snp_array$map$physical.pos)

# Use clumping (on the MAF) to keep SNPs weakly correlated with each other.
ind.keep <- snp_clumping(G, infos.chr = snp_array$map$chromosome,
                         exclude = ind.excl,
                         ncores = 1)

#filter and load again the values: 
snp_array_filtered = snp_subset (snp_array, ind.col = ind.keep)
snp_array = snp_attach (snp_array_filtered)




saveRDS(snp_array, "OUTPUT/genomic_preprocessing/rdsDir/bigSNPr_prepro.rds")




## TSNE of the genomic data: 
#Metadata: 
samples_metadata <- readRDS("OUTPUT/feature_selection/rds/samples_metadata.rds")

G <- snp_fastImputeSimple(snp_array$genotypes, method = "random")
G <- G[]
colnames(G) <- snp_array$map$marker.ID
rownames(G) <- snp_array$fam$family.ID


tsne_G<- Rtsne (G)

tsne_G$Y %>% as.data.frame() %>% 
  rename("DIM1" = V1, "DIM2" = V2) %>%
  cbind (., SXS = snp_array$fam$family.ID ) %>% 
  left_join(., samples_metadata %>% select (SXS, Exposure)) %>% 
  ggplot (aes (x = DIM1, y = DIM2, color = Exposure)) + 
  geom_point() + 
  labs (color = "Exposition") +
  theme_bw()

ggsave ("tnse_genomic.png", path = "OUTPUT/genomic_preprocessing/")







