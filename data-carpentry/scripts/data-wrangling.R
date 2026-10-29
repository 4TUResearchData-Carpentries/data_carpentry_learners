
# Load the libraries
library(tidyverse)
library(here)

interviews <- read_csv(here("data","SAFI_clean.csv"))

# select specific columns

select( interviews, village)
select( interviews, village, no_membrs, years_liv)
## Select multiple columns
interviews2 <- select( interviews , village:rooms )
## select columns starting with "no_"
interviews2 <- select( interviews, starts_with('no_') )

# Filtering rows/observations
filter( interviews , village=='Ruaca' )

interviews2 <- select( interviews, village, rooms)
interviews2 <- filter( interviews2 , village == 'Ruaca')

# alternative with pipe 

interviews2 <- interviews %>%
  select( village,rooms ) %>%
  filter( village == 'Ruaca' )
  
## Exercise

exercise1 <- interviews %>%
  filter(memb_assoc=='yes') %>%
  select(affect_conflicts,liv_count,no_meals)

## Making calculations using mutate

interviews3 <- interviews %>%
  mutate( people_per_room = no_membrs /rooms )

  
## exercise 2

exercise2 <- interviews %>%
  mutate( total_meals = no_meals * no_membrs) %>%
  select(village,total_meals) %>%
  filter(total_meals>20)


## Statistical function

interviews4 <- interviews %>%
  summarise( avg_rooms = mean(rooms) )

# sd() for standard deviations
# min() for extracting minumum 
# max() for extracting maximum
# n() for counting the number rows


# group by

interviews5 <- interviews %>%
  group_by( village ) %>%
  summarise( avg_rooms = mean(rooms) , sd_room = sd(rooms))
  
  
