
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
