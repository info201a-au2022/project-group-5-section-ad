# BuildMap file: function that returns a plotly map
library(plotly)
library(ggplot2)
library(maps)
library(dplyr)
library(tidyverse)

# BuildMap function: fill this in with a function that returns a map:

build_map <- function(data, input) {
  map_data <- map_data("state")
  colnames(data) <- c("region", "Video.Games")
  data$region <- tolower(data$region)
  map_data <- left_join(map_data, data, by = "region")
  if(input != "All States") {
    map_data <- map_data %>% 
      filter("region" == input)
  }
  plot <- ggplot(map_data, aes(x = long, y = lat, group=group)) +
    geom_polygon(aes(fill = Video.Games), color = "black")
  return(plot)
}