# server.R
library(dplyr)

# Read in data
source("./source/build_map.R")
source("./source/build_scatter.R")
source("./source/summary_info.R")
source("./source/build_bar.R")
source("./source/table_summary.R")

# Start shinyServer
server <- function(input, output) { 
  
  # Render a plotly object that returns a map
  output$map <- renderPlotly({
    return(build_map(games_data, input$games))
  })
  
  # Render a plotly object that returns a scatter plot
  output$scatter <- renderPlotly({
    return(build_scatter(crimes_table, input$state))
  })
  
  # Render a plotly object that returns a barplot
  output$bar <- renderPlotly({
    return(build_bar(crimes_table, input$statebar))
  })
  
}