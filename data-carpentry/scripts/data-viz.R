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
    geom_boxplot() +
    geom_jitter(
      alpha = 0.5,
      color = "skyblue",
      height = 0.2,
      width = 0.2
    )

## Exercise 2

interviews_plotting %>%
  ggplot(aes(x = respondent_wall_type, y = rooms)) +
  geom_violin()

interviews_plotting %>%
  ggplot(aes(x = respondent_wall_type, y = rooms)) +
  geom_violin(aes(fill = respondent_wall_type)) +
  geom_boxplot(
    width = 0.1
  )

# Bar plots

interviews_plotting %>%
  ggplot(aes(x = respondent_wall_type)) +
    geom_bar(aes(fill = village), position = "dodge")

# calculate percentages
percent_wall_type <- interviews_plotting %>%
  filter(respondent_wall_type != "cement") %>% 
  count(village, respondent_wall_type) %>% 
  group_by(village) %>% 
  mutate(percent = (n / sum(n)) * 100) %>% 
  ungroup()


percent_wall_type %>% 
  ggplot(aes(x= village, y = percent, fill = respondent_wall_type)) +
  geom_bar(position = "dodge", stat = "identity")

percent_wall_type %>% 
  ggplot(aes(x= village, y = percent, fill = respondent_wall_type)) +
  geom_col(position = "dodge")

## Exercise 3

interviews_plotting %>% 
  filter(!is.na(memb_assoc)) %>% 
  count(village, memb_assoc) %>% 
  group_by(village) %>% 
  mutate(percent = (n / sum(n )) * 100) %>% 
  ungroup() %>% 
  ggplot(aes(x = village, y = percent, fill = memb_assoc)) +
    geom_col(position = "dodge")


# Faceting
percent_wall_type %>% 
  ggplot(aes(x = respondent_wall_type, y = percent, fill = village)) +
    geom_col(position = "dodge") +
    facet_wrap(~ village)

# Customisation





