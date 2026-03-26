library(tidyverse)
library(here)

interviews_plotting <- read_csv(here("data/interviews_plotting.csv"))

# creating our first plot
interviews_plotting %>% 
  ggplot(aes(y = number_items, x = no_membrs)) +
    geom_point(alpha = 0.2)

interviews_plotting %>% 
  ggplot(aes(x = no_membrs, y = number_items)) +
    geom_jitter(
      alpha = 0.5,
      width = 0.2,
      height = 0.2,
      colour = "chocolate" # add single colour
    )

interviews_plotting %>% 
  ggplot(aes(x = no_membrs, y = number_items, colour = village)) +
  geom_jitter(
    alpha = 0.5,
    width = 0.2,
    height = 0.2
  )

# Exercise
interviews_plotting %>%
  ggplot(aes(x = village, y = rooms, colour = respondent_wall_type)) +
  geom_point() +
  theme_classic() +
  scale_colour_viridis_d() # add colourblind-friendly palette

# Box plots
interviews_plotting %>% 
  ggplot(aes(x = respondent_wall_type, y = rooms)) +
    geom_boxplot() +
    geom_jitter(
      width = 0.2,
      height = 0.2,
      colour = "tomato",
      alpha = 0.5
    )

# Exercise
interviews_plotting %>%
  ggplot(aes(x = respondent_wall_type, y = rooms)) +
  geom_violin() +
  geom_jitter(alpha = 0.5, color = "tomato")

interviews_plotting %>%
  ggplot(aes(x = respondent_wall_type, y = rooms)) +
  geom_violin(aes(fill = respondent_wall_type), show.legend = FALSE) +
  geom_boxplot(width = 0.1)
  
# Barplots
interviews_plotting %>% 
  ggplot(aes(x = respondent_wall_type)) +
    geom_bar(aes(fill = village), position = "dodge")

# compare proportions of each type in each village

percent_wall_type <- interviews_plotting %>% 
  filter(respondent_wall_type != "cement") %>% 
  count(village, respondent_wall_type) %>% 
  group_by(village) %>% 
  mutate(percent = (n / sum(n)) * 100) %>% 
  ungroup()

percent_wall_type %>% 
  ggplot(aes(x = village, y = percent, fill = respondent_wall_type)) +
  #geom_bar(stat = "identity")
  geom_col()

# Exercise
percent_memb_assoc <- interviews_plotting %>%
  filter(!is.na(memb_assoc)) %>%
  count(village, memb_assoc) %>%
  group_by(village) %>%
  mutate(percent = (n / sum(n)) * 100) %>%
  ungroup()

percent_memb_assoc %>%
  ggplot(aes(x = village, y = percent, fill = memb_assoc)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(percent)), hjust = 1)

# facetting plots
percent_wall_type %>% 
  ggplot(aes(x = respondent_wall_type, y = percent)) +
  geom_col() +
  facet_wrap(~ village, ncol = 1) +
  theme_bw() +
  labs(x = "Respondent wall type", y = "Percent (%)") +
  theme(axis.title = element_text(size = 42))

ggsave(filename = "fig_output/my-first-plot.png", width = 120, height = 180, units = "mm")
  
  








  
  
  
