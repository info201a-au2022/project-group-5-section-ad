# ui.R
library(shiny)
library(plotly)
source("./source/summary_info.R")


# Defines a variable 'Introduction' that is used to explain about the project and goals
introduction <- fluidPage(
  h1("Introduction"),
  p("For years, people have associated playing video games to violence, believing that people who play video games are more likely to become criminals. This has piqued the interest of the  research topic of “is video games a cause of crime rates?” To answer this question, we will have to look at two types of data. The first being the number of crimes that occurred in each year  in the United States. The second is the most popular game each year. With this data, we will be able to see if the genre of the game will have a factor in the number of crimes."),
  
  h2("Problem Domain:"),
  h3("Background:"),
  p("As a group collectively, we like to play games whether that be first-person shooters or party games on the Nintendo Switch. And recently there have been a lot of shootings and criminal activity that has been happening near the UW campus. We have all also heard that violent video games may cause an increase in violent behaviors in a person. So we were wondering if the violence from video games had any impact on whether that person affected by video games would commit a crime."),
  h3("Stakeholders:"),
  p("The stakeholders in our situation are adolescents and the general public. In this case, adolescents are a direct stakeholder because the majority of the player base for most video games is adolescents. So they are the generation that is most susceptible to the violence that is in video games. Which can rub off into their personalities and potentially make them more violent. An indirect stakeholder in our project is the general public. The general public is a stakeholder because they will be the ones that are affected by the crimes that people make. People with very violent personalities and tendencies are more likely to commit crimes and hurt others.")
)

# Defines a variable 'select_state' that is used to get the user's input about
# which state they would like to see
select_state <- selectInput(
  inputId = "state",
  label = "Choose a State",
  choices = c("All States", summary_info[["states"]]),
  selected = "All States"
)

# Defines a variable 'state_bar' that is used to get the user's input about
# which state they would like to see (specific for the bar plot)
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

# Defines a variable 'takeaway_ui' that is used to format a takeaways page
takeaway_ui <- fluidPage(
  h1("Takeaways")
)

report_ui <- fluidPage(
  h1("Report"),
  h1("Is There a Correlation Between Video Games and Crime Rates?"),
  h2("Research Questions:"),
  h4("What are the crime rates of the different crimes in each states?"),
  h4("What is the most popular video games in each state?"),
  h4("What state has the highest total number of crimes?"),
  
  h2("What data was analyzed?"),
  p("To answer these questions, we analyze many data from the dataframe. The data that were examined to answer the questions were the 50 states in the United States, total number of crimes committed by each states, the different crimes that were committed in each states and the rates of each. Finally, we looked at and compared the most popular games in each states."),
  h2("Limitations"),
  p("- The limitation of this research is that there are many factors to why people commit crime. This will make it hard for us to tell if there truly is an association between video games and crimes.To address this issue, we will look at the type of crimes that were committed that year to see whether the types of crimes that are committed are similar to the genre of the video games."),
  p("- Due to the nature of our research correlation does not mean causation. The psychology of mental health issues and criminology is complex with many confounding variables that is hard to isolate with our skill cap at this time. As a result our project would rely on research studies to prove/disprove our statistical data.")
)

# Final webpage layout
ui <- navbarPage(
  title = "Video Games Criminals",
  tabPanel("About", introduction),
  tabPanel("Number of Offenses", scatter_ui),
  tabPanel("Rates", bar_ui),
  tabPanel("Most Popular Video Games", map_ui),
  tabPanel("Findings", takeaway_ui),
  tabPanel("Report", report_ui)
)