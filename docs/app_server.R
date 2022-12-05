# server.R
library(dplyr)

# Read in data
source('~/Documents/info201/Project/project-group-5-section-ad/source/first_chart.R')
source('~/Documents/info201/Project/project-group-5-section-ad/source/second_chart.R')
source('~/Documents/info201/Project/project-group-5-section-ad/source/third_chart.R')
source("~/Documents/info201/Project/project-group-5-section-ad/source/build_map.R")
source("~/Documents/info201/Project/project-group-5-section-ad/source/build_scatter.R")
source("~/Documents/info201/Project/project-group-5-section-ad/source/summary_info.R")

# Start shinyServer
server <- function(input, output) { 
  
  # Render a plotly object that returns your map
  #output$map <- renderPlotly({ 
    
  #}) 
  
  output$map <- renderPlotly({
    return(build_map(summary_info$games, input$state))
  })
  
  # Render a plotly object that returns your scatter plot
  #output$scatter <- renderPlotly({
    
  #})
  
  output$scatter <- renderPlotly({
    return(build_scatter(df, "Washington"))
  })
  
  output$bar <- renderPlotly({
    return(build_bar(crimes_table, input$state))
  })
  
}

