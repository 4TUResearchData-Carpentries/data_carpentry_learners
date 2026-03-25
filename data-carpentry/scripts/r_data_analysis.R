# two ways to read in data
#read_csv()
#read_table()
library(tidyverse)

read.csv("data/SAFI_clean.csv")
read_csv("data/SAFI_clean.csv")

library(here)
interviews <- read_csv(here("data", "SAFI_clean.csv"))



