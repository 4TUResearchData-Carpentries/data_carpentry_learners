installed.packages()
install.packages("tidyverse")

# calculator 
3+5
12/7
12*7
3-5
3^8

# testing naming
area_hectares <- 1.0
area_hectares * 2.47

r_length <- 7
r_width <- 8
r_area <- r_length*r_width

r_length <- 10

sqrt(9)
?sqrt

round(3.1415)
round(3.1415, digits = 2)
args(round)

# Vector
hh_members <- c(3,7,10,6)
respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks")

respondent_wall_type

length(respondent_wall_type)
typeof(hh_members)

possessions <- c("bicycle", "car", "television")
possessions <- c(possessions, "mobile phone")
possessions <- c("laptop", possessions)
possessions

?c


num_char <- c(1,2,3,"a")
num_logical <- c(1,2L, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1,2,3,"4")

num_logical <- c(1,2,3,TRUE)
num_logical
char_logical <- c("a","b","c",TRUE)
char_logical
combined_logical <- c(num_logical, char_logical)
combined_logical


# subsetting
respondent_wall_type
respondent_wall_type[2]
respondent_wall_type[1:3]
respondent_wall_type[c(3,2)]

# conditional subsetting
