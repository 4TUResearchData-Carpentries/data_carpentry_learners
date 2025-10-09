library(tidyverse)

interviews_plotting <- read_csv("data/interviews_plotting.csv")
interviews_plotting <- read_csv("data_output/interviews_plotting.csv")

interviews_plotting %>%
  ggplot(mapping = aes(x = no_membrs, y = number_items)) +
  geom_point(alpha = 0.2)

interviews_plotting %>%
  ggplot(mapping = aes(x = no_membrs, y = number_items)) +
  geom_jitter(
    width = 0.2,
    height = 0.2,
    alpha = 0.5,
    colour = "tomato"
  )

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter(
    aes(colour = village),
    width = 0.2,
    height = 0.2,
    alpha = 0.5
  ) +
  geom_smooth(method = "lm")


ggplot(mapping = aes(x = no_membrs, y = number_items, colour = village), data = interviews_plotting) +
  geom_count()
ggplot()

## Exercise 1
interviews_plotting %>%
  ggplot(aes(x = village, y = rooms, colour = respondent_wall_type)) +
  geom_jitter()

# Box plots

interviews_plotting %>%
  ggplot(aes(x = respondent_wall_type, y = rooms)) +
    geom_boxplot()













