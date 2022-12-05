# Build Scatter file: function that returns a plotly Scatter plot
library(plotly)
library(stringr)

### Build Scatter ###
build_scatter <- function(data, input) {
  if (input == "All States") {
    plot <- ggplot(data, aes(x = State, y = Total_Offenses, col = State)) +
      geom_point() +
      coord_cartesian(xlim = c(0, 50),
                      ylim = c(0, 1640000))
    return(plot)
  } else {
    data <- data %>% 
      filter(State %in% input)
    plot <- ggplot(data = data, aes(x = State, y = Total_Offenses, col = State)) +
      geom_point() +
      coord_cartesian(xlim = c(0, 50),
                      ylim = c(0, 1640000))
    return(plot)
  }
}

