installed.packages()

install.packages("tidyverse")

3+5
12/7
12*7
3^8

area_hectares <- 1.0
area_hectares

# arithmetic with objects
area_hectares * 2.47

area_acres <- area_hectares * 2.47

area_hectares <- 2.5
area_hectares * 2.47

area_acres


# Solution 

r_length <- 100
r_width <- 10
r_multiplied <- (r_length * r_width)
print(r_multiplied)

# Functions 
sqrt(9)
sqrt(area_acres)

round(3.1415)
args(round)
round(3.1415, digits = 2)

#Solution Exercise 2

floor(1.624)


# Vector 
hh_members <- c(3, 7 ,10, 6)

respondent_wall_type <- c("muddaub", "burntbricks",
                          "sunbricks")
respondent_wall_type

length(respondent_wall_type)
length(hh_members)


# Add elements

possessions <- c("bicycle", "car", "television")
possessions <- c(possessions, "mobile phone")
possessions <- c("laptop", possessions)
possessions

# Subsetting vectors 

respondent_wall_type[2]

