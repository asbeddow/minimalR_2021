library(tidyverse)
library(readxl)

pcoa <- read_tsv(file='raw_data/baxter.braycurtis.pcoa.axes', 
                 col_types = cols(group = col_character()))


metadata <- read_excel(path='raw_data/baxter.metadata.xlsx',
                       col_types = c(sample ='text', fit_result = 'numeric',
                                     site = 'text', Dx_bin = 'text', dx ='text',
                                     Hx_prev = 'logical', Hx_of_Polyps = 'logical',
                                     Age = 'numeric', Gender = 'text', Smoke = 'logical',
                                     Diabetic = 'logical', Hx_Fam_CRC = 'logical', Height = 'numeric', 
                                     Weight = 'numeric', NSAID = 'logical', 
                                     Diabetes_Med = 'logical', stage = 'text')) %>%
  mutate(age_in_months = Age*12)%>%
  mutate(Height = Height/100, Height = na_if(Height, 0))%>%
  mutate(Weight = na_if(Weight, 0))%>%
  mutate(Site = recode(.x=Site, 'U of Michigan'='U Michigan'))%>%
  mutate(Dx_Bin = recode(.x=Dx_Bin, 'Cancer.'='Cancer')) %>%
  mutate(Gender = recode(.x=Gender, 'f'='female', 'm'='male'))%>%
  rename_all(tolower) %>%
  rename(previous_history=hx_prev, history_of_polyps=hx_of_polyps, 
         family_history_of_crc=hx_fam_crc, diagnosis_bin=dx_bin,
         diagnosis=dx, sex=gender, height_cm=height, weight_kg=weight)%<%



metadata_pcoa <- inner_join(metadata, pcoa, by=c('sample'='group'))

#write_tsv(metadata, path = 'processed_data/baxter.metadata_clean.tsv')
#write_tsv(pcoa, path = 'processed_data/baxter.braycurtis.pcoa_clean.axes')
#write_tsv(metadata_pcoa, path = 'processed_data/metadata_pcoa_clean.tsv')

