
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
  
  
