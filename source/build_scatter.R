# Build Scatter file: function that returns a plotly Scatter plot
library(plotly)
library(stringr)

### Build Scatter ###
build_scatter <- function(data, input) {
  if (input == "All States") {
    plot <- ggplot(data, aes(x = State, y = Total_Offenses, col = State)) +
      geom_point() +
      coord_cartesian(xlim = c(0, 50),
                      ylim = c(0, 1640000)) +
      scale_y_continuous(limits = c(0, max(data$Total_Offenses))) +
      theme(axis.text.x = element_blank()) + 
      labs(title = paste("Total Number of Offenses in Each State"),
           x = "State", y = "Total Number of Offenses")
    return(plot)
  } else {
    data <- data %>% 
      filter(State %in% input)
    plot <- ggplot(data = data, aes(x = State, y = Total_Offenses, col = State)) +
      geom_point() +
      coord_cartesian(xlim = c(0, 50),
                      ylim = c(0, 1640000)) +
      scale_y_continuous(limits = c(0, max(data$Total_Offenses))) +
      theme(axis.text.x = element_blank(),
            legend.position="none"
            ) + 
      labs(title = paste("Total Number of Offenses in", input, sep = " "),
           x = "State", y = "Total Number of Offenses")
    return(plot)
  }
}

