library(tidyverse)
library(readxl)

metadata_pcoa <- inner_join(metadata, pcoa, by=c('sample'='group'))

#write_tsv(metadata_pcoa, path = 'processed_data/metadata_pcoa_clean.tsv')