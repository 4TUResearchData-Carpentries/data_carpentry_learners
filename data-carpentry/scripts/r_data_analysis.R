# two ways to read in data
#read_csv()
#read_table()

library(tidyverse)

# in-built
read.csv("data/SAFI_clean.csv")
# from tidyverse
read_csv("data/SAFI_clean.csv")

library(here)
interviews <- read_csv(here("data", "SAFI_clean.csv"))

interviews <- read_csv(
  here("data", "SAFI_clean.csv"), 
  na = "NULL")
interviews

# These get overwritten by tidyverse
# filter(), lap()
# this is how to explicitly use the stats version (inbuilt)
# stats::filter()

head(interviews)
tail(interviews)
class(interviews)

# look at the structure
dim(interviews)
nrow(interviews)
ncol(interviews)

names(interviews)

# summarise our data
str(interviews)
summary(interviews)
glimpse(interviews)

interviews[1,1]
interviews[1, 6]
interviews[[1]]
interviews[1]
interviews[3, 7]

# range of values
interviews[1:3, 7]
# single row
interviews[3, ]

# can you replicate the head function?
# (get the first 6 rows of the data)


