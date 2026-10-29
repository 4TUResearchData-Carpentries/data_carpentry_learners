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
    height = 0.2
    )
