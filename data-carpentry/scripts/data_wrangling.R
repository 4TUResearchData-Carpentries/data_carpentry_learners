
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
