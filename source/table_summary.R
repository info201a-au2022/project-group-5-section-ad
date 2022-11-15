# Table Summary

library(dplyr)
library(stringr)

# Data
crimes_against_person <- read.csv(file = "~/Documents/info201/Project/project-group-5-section-ad/data/Crimes_Against_Persons_by_State_2021.csv")
crimes_against_property <- read.csv(file = "~/Documents/info201/Project/project-group-5-section-ad/data/Crimes_Against_Property_by_State_2021.csv")
crimes_against_society <- read.csv(file = "~/Documents/info201/Project/project-group-5-section-ad/data/Crimes_Against_Society_by_State_2021.csv")
games_data <- read.csv(file = "~/Documents/info201/Project/project-group-5-section-ad/data/game_data.csv")

# Creating table
crimes_table <- left_join(crimes_against_person, crimes_against_property, by = "State")
crimes_table <- left_join(crimes_table, crimes_against_society, by = "State")
crimes_table <- mutate(crimes_table, "Total Offenses" = Total.Offenses.x + Total.Offenses.y + Total.Offenses)
crimes_table <- select(crimes_table, -Total.Offenses.x)
crimes_table <- select(crimes_table, -Total.Offenses.y)
crimes_table <- select(crimes_table, -Total.Offenses)
crimes_table <- select(crimes_table, -Population.Covered.x)
crimes_table <- select(crimes_table, -Population.Covered.y)
crimes_table <- select(crimes_table, -Population.Covered)
games_data <- select(games_data, -X)
crimes_table <- left_join(crimes_table, games_data, by = "State")
