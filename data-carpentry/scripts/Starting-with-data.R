library(tidyverse)
library(here)
install.packages("here")

stats::filter() #overrule the default

#importing data
interviews <- read_csv(
  here("data-carpentry", "data", "SAFI_clean.csv"),
  na = "NULL"
)

