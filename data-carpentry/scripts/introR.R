installed.packages()
install.packages("tidyverse")

3+5
12/7
12*7
3^8


area_hectares <- 1.0
area_hectares

# Exercise 1 - Solution
r_length <- 5 #Saved length
r_width <-  4
r_area <- r_length * r_width
r_area

sqrt(9)
sqrt(area_hectares)

area_acres <- area_hectares * 2.47

round(3.1415)
as.integer(1.624) #alternative: returns full number

#Solution Exercise 2
floor(1.624) # rounds down

hh_members <- c(3,7,10,6)
hh_members

respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks")
respondent_wall_type

length(hh_members)
length(respondent_wall_type)

typeof(hh_members)
typeof(respondent_wall_type)

possessions <- c("bicycle", "car", "television")
possessions <- c(possessions, "mobile phone")
possessions

possessions <- c("laptop", possessions)
possessions
# Exercise 3
num_char <- c(1,2,3,"a")
num_logical <- c(1,2L, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1,2,3,"4")

#Exercise 4
num_logical <- c(1,2,3,TRUE,FALSE)
char_logical <- c("a","b","c",TRUE)
combined_logical <- c(num_logical, char_logical)
combined_logical


respondent_wall_type[2]
respondent_wall_type[1:3]
respondent_wall_type[c(3,2)]

hh_members[c(TRUE, FALSE, TRUE, TRUE)]

hh_members > 5
hh_members[hh_members >5]

hh_members[hh_members < 4 | hh_members > 7]
hh_members[hh_members >= 4 & hh_members <= 7]

possessions[possessions == "laptop" | possessions == "bicycle" | possessions == "house"]

possessions[possessions %in% c("laptop", "bicycle")]
possessions %in% c("laptop", "bicycle")

search_for <- c("laptop", "bicycle")
possessions[possessions %in% search_for]

# Missing data
rooms <- c(2,1,1,NA,7)
rooms

mean(rooms)
mean(rooms, na.rm = TRUE)
