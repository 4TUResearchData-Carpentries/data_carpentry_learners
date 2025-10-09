
# load he packages
library(tidyverse)
library(here)

interviews <- read_csv( here("data","SAFI_clean.csv") , na = "NULL")

# select the village column
select( interviews , village )

# select multiple columns
select( interviews , village , no_membrs , interview_date)

# select range of columns
select( interviews, village:respondent_wall_type )

# select all columns staring with 'no_'
select( interviews, starts_with('no_') )

interviews2 <- select( interviews, starts_with('no_') )

## Filtering 

filter( interviews , village == 'Ruaca' ) 


# Pipe operator

interviews3 <- interviews %>% 
  select( village , interview_date ) %>%
  filter( village == 'Ruaca')


## Exercise 1

exercise1 <- interviews %>%
  filter(memb_assoc=='yes') %>%
  select(affect_conflicts,liv_count,no_meals)

# Mutate

interviews4 <- mutate( interviews , people_per_room = no_membrs / rooms )

# Exercise 2

exercise2 <- interviews %>%
  mutate(total_meals = no_meals * no_membrs) %>%
  select( village, total_meals ) %>%
  filter( total_meals > 20 )

# mean() for mean
# min()
# max()
# sd()
# n()

## summary statistics
interviews4 <- interviews %>%
  summarise( mean_room = mean(rooms) )

# group by
interviews4 <- interviews %>%
  group_by(village) %>%
  summarise( mean_rooms = mean(rooms) ) 

# count the number of interviews
interviews4 <- interviews %>%
  group_by(village) %>%
  summarise( number_interviews = n() ) 

# exercise 3

exercise3 <- interviews %>%
  group_by(no_meals) %>%
  summarise(total_meals = n() )

library(lubridate)

month(interviews$interview_date)
year(interviews$interview_date)

# pivot_wider and pivot_longer

long_data <- interviews %>%
  group_by(interview_date) %>%
  summarise( number_of_date = n() ) %>%
  arrange( interview_date )

wide_date <- pivot_wider( long_data , 
                    names_from = interview_date ,
                    values_from = number_of_date) 

transposed_interviews <- as_tibble( t(interviews) )

write_csv(interviews2, here( "data","changed_data.csv" ) )


## Plotting data ##
interviews_plotting <- interviews %>%
  ## pivot wider by items_owned
  separate_longer_delim(items_owned, delim = ";") %>%
  replace_na(list(items_owned = "no_listed_items")) %>%
  ## Use of grouped mutate to find number of rows
  group_by(key_ID) %>% 
  mutate(items_owned_logical = TRUE,
         number_items = if_else(items_owned == "no_listed_items", 0, n())) %>% 
  pivot_wider(names_from = items_owned,
              values_from = items_owned_logical,
              values_fill = list(items_owned_logical = FALSE)) %>% 
  ## pivot wider by months_lack_food
  separate_longer_delim(months_lack_food, delim = ";") %>%
  mutate(months_lack_food_logical = TRUE,
         number_months_lack_food = if_else(months_lack_food == "none", 0, n())) %>%
  pivot_wider(names_from = months_lack_food,
              values_from = months_lack_food_logical,
              values_fill = list(months_lack_food_logical = FALSE))
