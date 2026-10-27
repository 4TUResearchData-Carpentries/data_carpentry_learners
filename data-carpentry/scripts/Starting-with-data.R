library(tidyverse)
library(here)
install.packages("here")

stats::filter() #overrule the default

#importing data
interviews <- read_csv(
  here("data-carpentry", "data", "SAFI_clean.csv"),
  na = "NULL"
)

#after setting the working directory to the folder:
interviews <- read_csv("SAFI_clean.csv")

interviews

#inspecting the data frame
class(interviews)

##size
dim(interviews)
nrow(interviews)
ncol(interviews)

#content
head(interviews)
tail(interviews)

##names
names(interviews)
str(interviews)
summary(interviews)
glimpse(interviews)

#subsetting data frames
interviews[1, 1] #subset just the first row and first column, so 1 cell
interviews[6, 4]
interviews[[1]]
interviews[1] 
interviews[3, ] #select row 3 with all values
interviews[ , 1]
