#Summary Information

#reading in our data sets
crimes_against_persons <- read.csv(file = "./data/Crimes_Against_Persons_by_State_2021.csv")
crimes_against_property <- read.csv(file = "./data/Crimes_Against_Property_by_State_2021.csv")
crimes_against_society <- read.csv(file = "./data/Crimes_Against_Society_by_State_2021.csv")
game_data <- read.csv(file = "./data/game_data.csv")

#summary list
summary_info <- list()
summary_info$states <- game_data$State
summary_info$num_states <- nrow(crimes_against_persons)
summary_info$games <- unique(game_data$Video.Games)
summary_info$num_games <- length(unique(game_data$Video.Games))
summary_info$total_offenses_state <- crimes_against_persons$Total.Offenses +
  crimes_against_property$Total.Offenses +
  crimes_against_society$Total.Offenses
summary_info$total_offenses_us <- sum(summary_info$total_offenses_state)

