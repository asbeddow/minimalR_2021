source('code/baxter_data_clean.R')

metadata <- mutate(metadata, diagnosis = factor(diagnosis, levels = c('normal', 'adenoma', 'cancer')))

ggplot(metadata, aes(x=site, fill=diagnosis))+
  geom_bar(position = position_dodge2()) +
  scale_fill_manual(name=NULL,
                    values = c('lightgreen', 'purple', 'orange'),
                    breaks = c('normal', 'adenoma', 'cancer'),
                    labels = c('Normal', 'Adenoma', 'Cancer')) +
  labs(title = 'Number of male and female subjects at each center',
       x=NULL,
       y='Number of subjects') +
    theme_classic()
