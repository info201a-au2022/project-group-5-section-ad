# BuildMap file: function that returns a plotly map
library(plotly)
library(ggplot2)
library(maps)
library(dplyr)
library(tidyverse)

# BuildMap function: fill this in with a function that returns a map:

build_map <- function(data, input) {
  map_data <- map_data("state")
  colnames(data) <- c("region", "Video_Games")
  data$region <- tolower(data$region)
  map_data <- left_join(map_data, data, by = "region")
  if(input != "All Games") {
    map_data <- map_data %>% 
      filter(Video_Games %in% input)
  }
  plot <- ggplot(map_data, aes(x = long, y = lat, group=group, 
                               text= paste("State: ", toupper(map_data$region), "<br>", 
                               "Video Game: ", map_data$Video_Games))) +
    geom_polygon(aes(fill = Video_Games), color = "black")
  return(ggplotly(plot, tooltip = c("text")))
}