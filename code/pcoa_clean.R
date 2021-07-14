library(tidyverse)
library(readxl)

pcoa <- read_tsv(file='raw_data/baxter.braycurtis.pcoa.axes', 
                 col_types = cols(group = col_character()))

#write_tsv(pcoa, path = 'processed_data/baxter.braycurtis.pcoa_clean.axes')
