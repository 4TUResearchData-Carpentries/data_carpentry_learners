##Data wrangling 
##load the packages
library(tidyverse)
library(here)
##read the data
interviews<-read_csv(here("data","SAFI_clean.csv"),na="NULL")
##we select specific columns
select(interviews,village)
select(interviews,village,no_membrs, rooms)
interviews2<-select(interviews,village:memb_assoc)
##select columns with a certain pattern
interviews3<-select(interviews, starts_with("no_")) 
view(interviews3)
##Filtering
interviews4<-filter(interviews, village=="Ruaca")
##test for multiple criteria
interviews4_1<-filter(interviews,village=="Ruaca" & no_membrs>5)
##selection and filtering at the same time
##filter observations for Ruaca village but to return in result columns from village to rooms
interviews5_1<-select(interviews,village:rooms)
interviews5_2<-filter(interviews5_1, village=="Ruaca")
##Pipes
interviews5<-interviews %>% select(village:rooms) %>% 
  filter(village=="Ruaca")
##Exercise 1
exercise1<-interviews %>% filter(memb_assoc=='yes') %>% 
  select(affect_conflicts, liv_count, no_meals)
##Adding new column based on a calculation - number of people per room
interviews6<-interviews %>% mutate(people_per_room=no_membrs/rooms)
interviews6_1<-interviews %>% mutate(total_meals=no_meals*no_membrs)
##Exercise 2
exercise2<-interviews %>% mutate (total_meals=no_membrs*no_meals) %>% 
  select(village, total_meals) %>% filter(total_meals>20)
##calculate the average number of rooms
interviews7<- interviews %>% summarise(avg_rooms=mean(rooms))
##calculate the average number of rooms PER VILLAGE
interviews7_1<-interviews %>% group_by(village) %>%
  summarise(avg_rooms=mean(rooms))
##Exercise 3
exercise3<- interviews %>% group_by(no_meals) %>% 
  summarise(household_per_no_meals=n())
library(lubridate)
##Select villages that were interviewed in MAY
interviews9<-interviews %>% filter(month(interview_date)==5) %>% 
  select (village, interview_date)
#Exercise4
exercise4<-interviews %>% mutate(month_interviewed=month(interview_date),year_interviewed=year(interview_date)) %>% 
  group_by(month_interviewed, year_interviewed) %>% 
  summarise(largest_hh=max(no_membrs))

nr_interviews <- interviews %>%
  group_by(interview_date) %>%
  summarise(number_interviews = n())

wide_data <- pivot_wider( nr_interviews , 
                          names_from = interview_date, 
                          values_from = number_interviews )

long_data <- pivot_longer( wide_data , 
      cols = `2016-11-16`:`2017-06-04`,
      names_to = 'interview_date' ,
      values_to = 'number_interviews' )

write_csv(long_data,here('data','long_data.csv'))

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

write_csv(interviews_plotting,here('data','interviews_plotting.csv'))      
