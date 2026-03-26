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

  
  
  
