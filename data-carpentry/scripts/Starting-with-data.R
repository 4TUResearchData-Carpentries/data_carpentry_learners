#When you start, make sure the libraries you need are loaded:
library(tidyverse)
library(here)
# if you you get an error you may need to install the here package, like this:
install.packages("here") 
#then run this command again to load it:
library(here)
#if a function does not work below, the relevant library may not be loaded
#you can load it again to be sure
#remember to press run for every line of code (or use the short cut control+enter or cmd + enter)

stats::filter() #overrule the default function when there are two with the same name


# 1. importing data
interviews <- read_csv(
  here("data", "SAFI_clean.csv"),
  na = "NULL"
)
#your folder structure may be different
#when you run the 'here' library, it will tell you where it starts from
#ensure you have a clear folder structure and that you know where your data files are

#instead of the here function, you can also set the working directory directly to the right folder
setwd("insert your folder path") 
#or in the Files pane, navigate to the cog wheel and select 'set working directory'
#after setting the working directory to the folder:
interviews <- read_csv("SAFI_clean.csv")

#to check if it went ok:
interviews 
#you also see the object in the Environment pane


# 2. inspecting the data frame
class(interviews)

##size
dim(interviews) #number of rows and columns/variables
nrow(interviews) #number of rows
ncol(interviews) #number of columns/variables

##content
head(interviews) #the first six rows
tail(interviews) #the last six rows

##names
names(interviews) #variable names
str(interviews) #structure
summary(interviews) #summary statistics
glimpse(interviews)


# 3. subsetting data frames
interviews[1, 1] #subset just the first row and first column, so 1 cell
interviews[6, 4] #subset just the 6th row of the 4th column, also 1 cell
interviews[[1]] #subset the first column as a vector
interviews[1] #subset the first column as a variable
interviews[3, ] #subset row 3 with all variables/columns
interviews[ , 1] #subset column 1 with all rows
interviews[1:6, ] #first six rows, same as head()
interviews[ ,-1] #exclude first column

#Exercise 1a+b
interviews_100 <- interviews[1:100, ] #this gives the first 100 rows
interviews_just100 <- interviews[100, ] #this gives the 100th row only

interviews_last <- interviews[nrow(interviews), ] #only the last row, using the nrow function
interviews_last <- interviews[131, ] #you can write it like this too, since you know there are 131 rows
interviews_last #print it in the console to check
nrow(interviews) #the nrow function gives the number of rows in the data frame 
tail(interviews) #check your result with the tail function: did you indeed get the last row?

#Exercise 2a+b
n_rows <- nrow(interviews) #you can make a new object to use
interviews_middle <- interviews[median(1:n_rows), ] #using the median function plus the object based on nrows()

#Exercise 2b asked to combine the nrow() function with the - notation to reproduce the behaviour of head(interviews)
#so keeping just the first six rows of the interviews data frame
interviews_head <- interviews[-(7:n_rows), ]
#we make a new object, 'interviews_head'
#we use the minus sign to select 'everything except'
#we specify we want to exclude row 7 to 'n_rows'
#we made the object 'n_rows' earlier to save the outcome of 'nrow(interviews)'


# 4. Factors
respondent_floor_type <- factor(c("earth", "cement", "cement", "earth")) #here we made a new object with four values and told R to treat this as a factor
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


