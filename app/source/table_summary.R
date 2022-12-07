# Table Summary

library(dplyr)
library(stringr)


# Loading data
crimes_against_person <- read.csv(file = "./data/Crimes_Against_Persons_by_State_2021.csv", check.names=FALSE)
crimes_against_property <- read.csv(file = "./data/Crimes_Against_Property_by_State_2021.csv", check.names=FALSE)
crimes_against_society <- read.csv(file = "./data/Crimes_Against_Society_by_State_2021.csv", check.names=FALSE)
games_data <- read.csv(file = "./data/game_data.csv", check.names=FALSE)

# Merging data from all crimes together
crimes_person_property <- left_join(crimes_against_person, crimes_against_property, by = "State")
crimes_table <- left_join(crimes_person_property, crimes_against_society, by = "State")

# Add Total offenses of every states
crimes_table <- mutate(crimes_table, "Total_Offenses" = Total_Offenses.x + Total_Offenses.y + Total_Offenses)

# Removing unnecessary data. 3 different total offenses of each crimes and the total population covered
crimes_table <- select(crimes_table, -Total_Offenses.x)
crimes_table <- select(crimes_table, -Total_Offenses.y)
crimes_table <- select(crimes_table, -Population_Covered.x)
crimes_table <- select(crimes_table, -Population_Covered.y)
crimes_table <- select(crimes_table, -Population_Covered)

# Removing unnecessary column from games data, specifically number labels of each states
games_data <- select(game_data, -X)

# Merge data from games data into crimes table
crimes_table <- left_join(crimes_table, games_data, by = "State")

# Groups crimes data by state
crimes_table <- crimes_table %>%
  group_by(Total_Offenses)

