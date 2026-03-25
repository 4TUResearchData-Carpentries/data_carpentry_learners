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

interviews[1:6, ]

# what about excluding 
interviews[ , -1]

interviews[-c(7:131), ]

# access by name
interviews["village"]
interviews[ ,"village"]
interviews[["village"]]
interviews$village

# Create a dataframe (tibble) containing only the data 
# in row 100 of the dataset
interview_100 <- interviews[100,]
interview_100

# Use the interviews dataframe again ->
# use nrow to pull out the last row of the df (dataframe)
# compare to last row with tail
# Pull out the last row with nrow directly 
last_row <- interviews[nrow(interviews), ]
tail(interviews)

# Use number of rows in the dataset to extract the middle row
# and store in an object, interviews_middle
interviews_middle <- interviews[median(interviews$key_ID), ]
interviews_middle
interviews_middle <- interviews[round(nrow(interviews)/2, 0), ]
interviews_middle

# Example of using factors
respondent_floor_type <- factor(c("earth", "cement", 
                                  "cement", "earth"))
respondent_floor_type
levels(respondent_floor_type)
nlevels(respondent_floor_type)
respondent_floor_type <- factor(
  respondent_floor_type, 
  levels = c("earth", "cement"))
respondent_floor_type
respondent_floor_type <- fct_recode(respondent_floor_type, 
                                    brick = "cement")
# ordered factors
respondent_floor_type <- factor(respondent_floor_type, 
                                        ordered = TRUE)
respondent_floor_type

ordered_cat <- factor(c("low", "high", "low", "medium", "high"), 
                      levels = c("low", "medium", "high"), 
                      ordered = TRUE)
ordered_cat
as.character(respondent_floor_type)
year_fct <- factor(c(1990, 1983, 1977, 1998, 2001))
year_fct
as.numeric(year_fct)
# to get the value instead of the index value
as.numeric(as.character((year_fct)))
# the recommended method is
as.numeric(levels(year_fct))[year_fct] 

# Create a vector from the df column "memb_assoc" 
memb_assoc <- interviews$memb_assoc
# convert into a factor
memb_assoc <- as.factor(memb_assoc)
# check it out
memb_assoc

plot(memb_assoc)

memb_assoc <- interviews$memb_assoc
memb_assoc[is.na(memb_assoc)] <- "undetermined"
memb_assoc <- as.factor(memb_assoc)
memb_assoc
plot(memb_assoc)

# rename the levels of the factor to have the first letter 
# in uppercase
memb_assoc <- fct_recode(memb_assoc, No = "no",
                         Undetermined = "undetermined", Yes = "yes")
# Can you create the barplot with undetermined 
# as the last value?
memb_assoc <- factor(memb_assoc, levels = c("No", "Yes", "Undetermined"))
plot(memb_assoc)
