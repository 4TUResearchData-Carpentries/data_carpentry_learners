library(tidyverse)
library(here)

interviews_plotting <- read_csv("data/interview_plotting.csv")

# creating the first plot
interviews_plotting %>% 
  ggplot(aes(x = no_membrs, y = number_items)) +
    geom_point(alpha = 0.2) 

# an alternative
interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter(
    alpha = 0.5,
    width = 0.2,
    height = 0.2,
    colour = "#000"
    )

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items, colour = village)) +
  geom_jitter(
    alpha = 0.5,
    width = 0.2,
    height = 0.2
  ) +
  scale_colour_viridis_d() # palette for better colours 

# Creating a box plot
interviews_plotting %>%
  ggplot(aes(x = respondent_wall_type, y = rooms)) +
    geom_boxplot() +
    geom_jitter(
      width = 0.2,
      alpha = 0.5,
      colour = "tomato"
    )
  
## Exercise 2  
interviews_plotting %>%
  ggplot(aes(x = respondent_wall_type, y = rooms)) +
  geom_violin() +
  geom_jitter(
    width = 0.2,
    alpha = 0.5,
    colour = "tomato"
  )
  
# Creating a bar plot
interviews_plotting %>%
  ggplot(aes(x = respondent_wall_type)) +
    geom_bar(aes(fill = village), position = "dodge")

# proportions instead of absolute counts
percent_wall_type <- interviews_plotting %>%
  filter(respondent_wall_type != "cement") %>%
  group_by(village) %>%
  count(village, respondent_wall_type) %>%
  mutate(percent = (n / sum(n)) * 100)

# the plot
percent_wall_type %>%
  ggplot(aes(x = village, y = percent, fill = respondent_wall_type)) +
    #geom_bar(stat = "identity") # allowing x AND y in geom_bar()
    geom_col() # same thing as above
  
## Exercise 3

# Create a bar plot showing the proportion of respondents in each
# village who are or are not part of an irrigation
# association (memb_assoc).
# 
# Include only respondents who answered that
# question in the calculations
# and plot.

percent_memb_assoc <- interviews_plotting %>%
  filter(!is.na(memb_assoc)) %>%
  count(village, memb_assoc) %>%
  group_by(village) %>%
  mutate(percent = (n / sum(n)) * 100) %>%
  ungroup()

percent_memb_assoc %>%
  ggplot(aes(x = village, y = percent, fill = memb_assoc)) +
    geom_col(position = "dodge")


# Faceting

percent_wall_type %>%
  ggplot(aes(x = respondent_wall_type, y = percent)) +
    geom_col(position = "dodge") +
    facet_wrap(~ village, ncol = 1) # a facet per factor in village















