source('code/baxter_data_clean.R')

metadata <- mutate(metadata, diagnosis = factor(diagnosis, levels = c('normal', 'adenoma', 'cancer')))

# ggplot(metadata, aes(x=site, fill=family_history_of_crc))+
#   geom_bar(position = position_dodge2()) +
#   scale_fill_manual(name='Family history of CRC',
#                     values = c('lightgreen', 'orange'),
#                     breaks = c('TRUE', 'FALSE'),
#                     labels = c('Yes', 'No')) +
#   labs(title = 'Number of male and female subjects at each center',
#        x=NULL,
#        y='Number of subjects') +
#     theme_classic()

# glimpse(metadata)

ggplot(metadata, aes(x=diagnosis, fill=site))+
  geom_bar(position = position_dodge2()) +
  scale_x_discrete(limits=c('normal', 'adenoma', 'cancer'),
                   labels=c('Normal', 'Adenoma', 'Cancer')) +
  scale_fill_manual(name='Site',
                    values = c('lightgreen', 'orange', 'blue', 'yellow'),
                    breaks = c('Dana Farber', 'MD Anderson', 'Toronto', 'U Michigan'),
                    labels = c('Dana Farber', 'MD Anderson', 'Toronto', 'U Michigan')) +
  labs(title = 'Number of male and female subjects at each center',
       x=NULL,
       y='Number of subjects') +
  theme_classic()
