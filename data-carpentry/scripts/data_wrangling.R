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
