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

# All rows for column 1
interviews[,1]

# All columns except from column 1
interviews[,-1]

interviews[ c('village', 'no_membrs', 'rooms')]

interviews$respondent_wall_type

## Solution 1 exercise 1

interviews_100 <- interviews[100,]
interviews_last <- interviews[ nrow(interviews) ,  ]
print(interviews_last)
tail(interviews)

# Factors

levels_walls <- factor( interviews$respondent_wall_type)
levels(levels_walls)
class(levels_walls)
nlevels(levels_walls)
levels(levels_walls)[1]
print(interviews$respondent_wall_type)

plot(levels_walls)

levels(levels_walls)[1] <- 'Burnt bricks'
plot(levels_walls)

levels_walls <- fct_recode( levels_walls, Cement = "cement" )
levels(levels_walls)

plot(levels_walls)

# Exercise 4

membr_levels <- factor(interviews$memb_assoc)
membr_levels <-fct_recode(membr_levels,No='no',Yes='yes')
plot(membr_levels)
