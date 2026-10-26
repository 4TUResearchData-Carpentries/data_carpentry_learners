library(tidyverse)
library(here)

interviews <- read_csv(
  here("data", "SAFI_clean.csv"),
  na = "NULL")

class(interviews)

dim(interviews) 
nrow(interviews)
ncol(interviews)

head(interviews)
tail(interviews)
names(interviews)
