library(tidyverse)
library(here)
# if you you get an error you may need to install the here package like this:
install.packages("here") 
#then run this again:
library(here)

stats::filter() #overrule the default

#importing data
interviews <- read_csv(
  here("data-carpentry", "data", "SAFI_clean.csv"),
  na = "NULL"
)
#your folder structure may be different
#when you run the here library, it will tell you where it starts from

#instead of the here function, you can also set the working directory directly to the right folder
setwd("insert your folder path") 
#or in the Files pane, navigate to the cog wheel and select 'set working directory'
#after setting the working directory to the folder:
interviews <- read_csv("SAFI_clean.csv")

#to check if it went ok:
interviews 

#inspecting the data frame
class(interviews)

##size
dim(interviews)
nrow(interviews)
ncol(interviews)

##content
head(interviews)
tail(interviews)

##names
names(interviews)
str(interviews)
summary(interviews)
glimpse(interviews)

#subsetting data frames
interviews[1, 1] #subset just the first row and first column, so 1 cell
interviews[6, 4] #subset just the 6th row of the 4th column, also 1 cell
interviews[[1]] #subset the first column as a vector
interviews[1] #subset the first column as a variable
interviews[3, ] #subset row 3 with all variables/columns
interviews[ , 1] #subset column 1 with all rows
interviews[1:6, ] #first six rows, same as head()
interviews[ ,-1] #exclude first column

#Exercise 1
interviews_100 <- interviews[1:100, ]
interviews_just100 <- interviews[100, ]
interviews_last <- interviews[nrow(interviews), ]
interviews_last <- interviews[131, ]
interviews_last
nrow(interviews)
tail(interviews)

n_rows <- nrow(interviews)
interviews_middle <- interviews[median(1:n_rows), ]

#Factors
respondent_floor_type <- factor(c("earth", "cement", "cement", "earth"))
levels(respondent_floor_type) #what are the levels that R assigned?
nlevels(respondent_floor_type) #how many levels are there?
respondent_floor_type #printing the output in the console

#by default, the levels are in alphabetical order
#to change the order:
respondent_floor_type <- factor(respondent_floor_type,
                                levels = c("earth", "cement"))
respondent_floor_type #print to check

#to rename level names:
respondent_floor_type <- fct_recode(respondent_floor_type,
                                    brick = "cement")
respondent_floor_type #print to check


