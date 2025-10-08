library(tidyverse)
# install.packages("here") <- if you don't have it 
library(here)

interviews <- read_csv(here("data", "SAFI_clean.csv"), 
                       na = "NULL")

head(interviews)
