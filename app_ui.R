# ui.R
library(shiny)
library(plotly)
source("./source/summary_info.R")


# Defines a variable 'Introduction' that is used to explain about the project and goals
introduction <- fluidPage(
  h1("Is There a Correlation Between Video Games and Crime Rates?"),
  h2("Problem Domain:"),
  h3("Does video games actually increase the chance that an individual will become a criminal?"),
  h2("Research Questions:"),
  h3("What are the crime rates of the different crimes in each states?"),
  h3("What is the most popular video games in each state?"),
  h3("What state has the highest total number of crimes?"),
  h2("What data was analyzed?"),
  h3("To answer these questions, we analyze many data from the dataframe."),
  h3("The data examed were: the different states, total number of crimes, most popular video games, and the rate of different crimes in each states")
  
)

# Defines a variable 'select_state' that is used to get the user's input about
# which state they would like to see
select_state <- selectInput(
  inputId = "state",
  label = "Choose a State",
  choices = c("All States", summary_info[["states"]]),
  selected = "All States"
)

state_bar <- selectInput(
  inputId = "statebar",
  label = "Choose a State",
  choices = summary_info[["states"]]
)

# Defines a variable 'map_ui' that is used to show a map
map_ui <- fluidPage(
  h1("map"),
  sidebarLayout(
    sidebarPanel(
      select_state
    ),
    mainPanel(
      plotlyOutput("map")
    )
  )
)

# Defines a variable 'scatter_ui' that is used to show a scatter plot
scatter_ui <- fluidPage(
  h1("Total Number of Offenses"),
  sidebarLayout(
    sidebarPanel(
      select_state
    ),
    mainPanel(
      plotlyOutput("scatter")
    )
  )
)

# Defines a variable 'bar_ui' that is used to show a bar plot
bar_ui <- fluidPage(
  h1("Rates of Crimes"),
  sidebarLayout(
    sidebarPanel(
      state_bar
    ),
    mainPanel(
      plotlyOutput("bar")
    )
  )
)

takeaway_ui <- fluidPage(
  h1("Takeaways")
)

# Final webpage layout
ui <- navbarPage(
  title = "Video Games Criminals",
  tabPanel("About", introduction),
  tabPanel("Number of Offenses", scatter_ui),
  tabPanel("Rates", bar_ui),
  tabPanel("Most Popular Video Games", map_ui),
  tabPanel("Findings", takeaway_ui)
)