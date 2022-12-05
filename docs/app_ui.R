# ui.R
library(shiny)
library(plotly)
#source("~/Documents/info201/Project/project-group-5-section-ad/docs/index.Rmd")


# Defines a variable 'Introduction' that is used to explain about the project and goals
introduction <- mainPanel(
  
)

# UI that stores the navigation bar for the website tabs.
ui <- navbarPage(
  "Video Game Criminals",
  introduction, 
  
)
