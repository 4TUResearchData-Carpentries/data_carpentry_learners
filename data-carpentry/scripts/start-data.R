library(tidyverse)
# install.packages("here") <- if you don't have it 
library(here)

interviews <- read_csv(here("data", "SAFI_clean.csv"), 
                       na = "NULL")
#first 6 rows 
head(interviews)

#last 6 rows 
tail(interviews)

#number of rows
nrow(interviews)

#number of columns
ncol(interviews)

dim(interviews)

names(interviews)

#summary statistics
summary(interviews)

# subset of data frames

# first row, first column
interviews[1,1]
class(typeof)

# Rows with indexes 1:3 and columns 5:7
interviews[1:3, 5:7]

# all columns from row 1 
interviews[1,]

#all rows for column 1
interviews[,1]

#all columns except from column 1
interviews[,-1]

interviews[ c('village', 'no_membrs', 'rooms')]
