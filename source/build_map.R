# BuildMap file: function that returns a plotly map
library(plotly)
library(stringr)
library(ggplot2)
library(maps)

# BuildMap function: fill this in with a function that returns a map:

build_map <- function(data, input) {
  if(input != "All States") {
    data <- data %>% 
      filter(State == input)
  }
  plot <- ggplot(data, aes(x = long, y = lat, group=group)) +
    geom_polygon(aes(fill = Video.Games), color = "black")
  return(plot)
}