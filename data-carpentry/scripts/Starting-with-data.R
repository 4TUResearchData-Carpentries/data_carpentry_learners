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
interviews[6, 4] #subset just the 6th row of the 4th column, also 1 cell
interviews[[1]] #subset the first column as a vector
interviews[1] #subset the first column as a variable
interviews[3, ] #subset row 3 with all variables/columns
interviews[ , 1] #subset column 1 with all rows
