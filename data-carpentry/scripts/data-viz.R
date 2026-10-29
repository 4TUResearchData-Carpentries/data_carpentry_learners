library(tidyverse)
library(here)

interviews_plotting <- read_csv("data/interview_plotting.csv")

# creating the first plot
interviews_plotting |> 
  ggplot()
