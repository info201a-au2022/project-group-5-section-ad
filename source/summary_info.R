#Summary Information

#reading in our data sets
crimes_against_persons <- read.csv(file = "~/Documents/info201/project-group-5-section-ad/data/Crimes_Against_Persons_by_State_2021.csv")
crimes_against_property <- read.csv(file = "~/Documents/info201/project-group-5-section-ad/data/Crimes_Against_Property_by_State_2021.csv")
crimes_against_society <- read.csv(file = "~/Documents/info201/project-group-5-section-ad/data/Crimes_Against_Society_by_State_2021.csv")
game_data <- read.csv(file = "~/Documents/info201/project-group-5-section-ad/data/game_Data.csv")

#summary list
summary_info <- list()
summary_info$states <- game_data$states
summary_info$games <- game_data$videogames
  

