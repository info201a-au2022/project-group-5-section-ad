# ui.R
library(shiny)
library(plotly)
#source("~/Documents/info201/Project/project-group-5-section-ad/docs/index.Rmd")


# Defines a variable 'Introduction' that is used to explain about the project and goals
introduction <- fluidPage(
  h1("Is There a Correlation Between Video Games and Crime Rates?"),
  
)

# Defines a variable 'map_ui' that is used to show a map
map_ui <- fluidPage(
  h1("map"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      plotlyOutput("map")
    )
  ),
  h1("Summary"),
  p("djksldfjds")
)

# Defines a variable 'scatter_ui' that is used to show a scatter plot
scatter_ui <- fluidPage(
  h1("scatter plot"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      plotlyOutput("scatter")
    )
  )
)

# Defines a variable 'select_state' that is used to get the user's input about
# which state they would like to see
select_state <- selectInput(
  inputId = "state",
  label = "Choose a State",
  choices = crimes_table$State,
  selected = "Washington"
)

# Defines a variable 'bar_ui' that is used to show a bar plot
bar_ui <- fluidPage(
  h1("bar plot"),
  sidebarLayout(
    sidebarPanel(
      select_state
    ),
    mainPanel(
      plotlyOutput("bar")
    )
  )
)

# Final webpage layout
ui <- navbarPage(
  title = "Video Games Criminals",
  tabPanel("intro", introduction),
  tabPanel("scatterplot", scatter_ui),
  tabPanel("barplot", bar_ui),
  tabPanel("map", map_ui)
)

