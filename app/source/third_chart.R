#map of united states and popular games

game_state <- read.csv("./data/game_data.csv")
game_state <- select(game_state, -X)
library("tidyverse")
library("ggplot2")
library("maps")
library("dplyr")

mapdata <- map_data("state")
colnames(game_state) <- c("region", "Video.Games")
game_state$region <- tolower(game_state$region)
mapdata <- left_join(mapdata, game_state, by = "region")

map <- ggplot(mapdata, aes(x = long, y = lat, group=group)) +
  geom_polygon(aes(fill = Video.Games), color = "black") +
  labs(title = "Most Popular Games in Each State")
map
