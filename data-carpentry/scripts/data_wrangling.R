
# load he packages
library(tidyverse)
library(here)

interviews <- read_csv( here("data","SAFI_clean.csv") , na = "NULL")

# select the village column
select( interviews , village )
