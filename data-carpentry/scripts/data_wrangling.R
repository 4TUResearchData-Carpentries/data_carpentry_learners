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
