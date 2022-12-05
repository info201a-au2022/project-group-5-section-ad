# Build Scatter file: function that returns a plotly Scatter plot
library(plotly)
library(stringr)

### Build Scatter ###
build_scatter <- function(data, input) {
  # Filter data based on search 
  data <- data %>% 
    filter(grepl(input, state))
  
  # Plot data
  p <- plot_ly(x = data$State,
            y = data$Total_Offenses, 
            mode="markers", 
            marker = list(
              opacity = .4, 
              size = 10
            )) %>% 
    layout(xaxis = list(range = c(0, xmax), title = input), 
           yaxis = list(range = c(0, ymax), title = "Total Offenses")
    )
  return(p)
}