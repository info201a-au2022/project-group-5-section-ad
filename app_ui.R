# ui.R
library(shiny)
library(plotly)
source("./source/summary_info.R")
source("./source/table_summary.R")


# Defines a variable 'Introduction' that is used to explain about the project and goals
introduction <- fluidPage(
  tags$head(
    tags$style(HTML("
      body {
        background-color: black;
        color: white;
      }
    "))
  ),
  h1("Introduction"),
  p("For years, people have associated playing video games to violence, believing that people who play video games are more likely to become criminals. This has piqued the interest of the  research topic of “is video games a cause of crime rates?” To answer this question, we will have to look at two types of data. The first being the number of crimes that occurred in each year  in the United States. The second is the most popular game each year. With this data, we will be able to see if the genre of the game will have a factor in the number of crimes."),
  
  h2("Problem Domain:"),
  
  h3("Background:"),
  p("As a group collectively, we like to play games whether that be first-person shooters or party games on the Nintendo Switch. And recently there have been a lot of shootings and criminal activity that has been happening near the UW campus. We have all also heard that violent video games may cause an increase in violent behaviors in a person. So we were wondering if the violence from video games had any impact on whether that person affected by video games would commit a crime."),
  
  h3("Stakeholders:"),
  p("The stakeholders in our situation are adolescents and the general public. In this case, adolescents are a direct stakeholder because the majority of the player base for most video games is adolescents. So they are the generation that is most susceptible to the violence that is in video games. Which can rub off into their personalities and potentially make them more violent. An indirect stakeholder in our project is the general public. The general public is a stakeholder because they will be the ones that are affected by the crimes that people make. People with very violent personalities and tendencies are more likely to commit crimes and hurt others."),
  
  h2("Research Questions:"),
  p("- What is the most popular game each year in the United States?"),
  p("- How many crimes are committed in the United States?"),
  p("- What type of crimes are most committed?"),
  
  h2("Data Analyzed:"),
  p("The data that were analyzed for this research were total number of crimes and how many times each crimes were committed in each states. Another data that was analyzed to solve our research question was the most popular video games in each states."),
  
  h2("Key Findings:"),
  p("- The state Texas had the highest number of total crimes committed while their most popular video game statewide was Grand Theft Auto V, a notorious video game about crimes."),
  p("- Every state in the United States had their two highest committed crimes being assault and theft."),
  p("- Despite every state having theft and assault as their most committed crimes, the type of video game that was most popular were not all very similar. Each had different video games that was most popular despite having the same most committed crimes."),
  p("- Every state had similar statistics for total number of crimes committed except for Texas.")
)

# Defines a variable 'select_state' that is used to get the user's input about
# which state they would like to see
select_state <- selectInput(
  inputId = "state",
  label = tags$span(style="color: gray;","Choose a State"),
  choices = c("All States", summary_info[["states"]]),
  selected = "All States"
)

# Defines a variable 'state_bar' that is used to get the user's input about
# which state they would like to see (specific for the bar plot)
state_bar <- selectInput(
  inputId = "statebar",
  label = tags$span(style="color: gray;","Choose a State"),
  choices = summary_info[["states"]]
)

# Defines a variable 'select_game' that is used to get the user's input about 
# which games they would like to see
select_game <- selectInput(
  inputId = "games",
  label = tags$span(style="color: gray;","Choose a Game"),
  choices = c("All Games", summary_info[["games"]]),
  selected = "All Games"
)

# Defines a variable 'map_ui' that is used to show a map
map_ui <- fluidPage(
  h1("Game Map"),
  
  p("This is a multivariable map that displays the most popular game in each state. Each game is represented by a different color. The type of games can be filtered to show which state it is most popular in. This is useful when used to correlate what type of crime a game may cause."),
  sidebarLayout(
    sidebarPanel(
      select_game
    ),
    mainPanel(
      plotlyOutput("map")
    )
  ),
  tags$footer("Information About the Video Games: ",
              tags$a(
                "Grand Theft Auto V, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Grand_Theft_Auto_V"),
              tags$a(
                "Bioshock, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/BioShock"),
              tags$a(
                "Cyberpunk 2077, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Cyberpunk_2077"),
              tags$a(
                "Doom, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Doom_(1993_video_game)"),
              tags$a(
                "Elden Ring, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Elden_Ring"),
              tags$a(
                "Final Fantasy VII, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Final_Fantasy_VII"),
              tags$a(
                "God of War, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/God_of_War_Ragnar%C3%B6k"),
              tags$a(
                "Hades, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Hades_(video_game)"),
              tags$a(
                "Horizon Zero Dawn, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Horizon_Zero_Dawn"),
              tags$a(
                "Portal, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Portal_(video_game)"),
              tags$a(
                "Red Dead Redemption 2, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Red_Dead_Redemption_2"),
              tags$a(
                "Resident Evil 2, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Resident_Evil_2"),
              tags$a(
                "Stardew Valley, ",
                target = "_blank",
                href = "https://stardewvalleywiki.com/Stardew_Valley_Wiki"),
              tags$a(
                "Teenage Mutant Ninja Turtles: Shredder's Revenge, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Teenage_Mutant_Ninja_Turtles:_Shredder%27s_Revenge"),
              tags$a(
                "The Elder Scrolls V: Skyrim - Special Edition, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Cyberpunk_2077"),
              tags$a(
                "The Legend of Zelda: Breathe of the Wild, ",
                target = "_blank",
                href = "https://elderscrolls.fandom.com/wiki/The_Elder_Scrolls_V:_Skyrim_Special_Edition"),
              tags$a(
                "The Witcher 3: Wild Hunt, ",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/The_Witcher_3:_Wild_Hunt"),
              tags$a(
                "Tomb Raider",
                target = "_blank",
                href = "https://en.wikipedia.org/wiki/Tomb_Raider")
  )
)

# Defines a variable 'scatter_ui' that is used to show a scatter plot
scatter_ui <- fluidPage(
  h1("Total Number of Offenses"),
  
  p("This is a multivariable scatterplot chart that displays the total number of offenses in every state. A colored dot represents each state. States can be individually selected to display their total amount of offenses and or individually removed to compare the number of offenses per state. This is useful when comparing the number of offenses between states and when used our other charts can show correlations between video games and offenses."),
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
  
  p("This is a multivariable bar chart that displays the amount and type of crime in each individual state. Each type of crime is highlighted in a different color. The number of types of crime is represented by the y-axis (Rates of Crime). The types of crime can be removed or added. This is useful when correlating crime and video games since certain crimes are visualized and or glorified in certain genres of games. "),
  
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
  h1("Takeaways"),

  
  h4("Total Crime in All States"),
  p("We noticed that the rate of crime for all the states tend to all between 0 and 500,000 offeneses with Texas as an outlier having over 1,500,000 offenses. But when comparing the frequency of each type of crime compared to its total amount of crimes Texas is similar to any other state. Because of the lack of evidence we can’t conclude that video games cause more crime since all the states seem consistant with its rates. "),
  
  h4("Rates of Each Type of Crime"),
  p("The bigguest take away from comparing the types and rate of each crime from the states is that we noticed that the most frequent crime is assult offenses and larceny/theft offenses. This trend is consistant throughout almost every state. When thinking about the scope of video games as a cause this suggests that our focus should be on game with action and or of the shooter genre. Which is often what media outlets blame video games to cause young teens to do."),
  
  h4("Rates of Each Type of Crime"),
  p("The biggest take away from comparing the types and rate of each crime from the states is that we noticed that the most frequent crime is assult offenses and larceny/theft offenses. This trend is consistant throughout almost every state. When thinking about the scope of video games as a cause this suggests that our focus should be on game with action and or of the shooter genre. Which is often what media outlets blame video games to cause young teens to do."),
  
  h4("Most Popular Game in Each State"),
  p("From looking at the popular games from each state we did notice that a majority of the states’ most popular games tended to fall under a type of action or shooter genre. Which reflects our assumption of what to focus on in our previous finding. Although when comparing the rates of crime and type between states with games that involve action and those that don’t, the type of crime rate and frequency of which tend not to differ."),
  

  h2("Content:"),
  p("In looking at our research, we were able to answer our questions by pairing research questions together when answering them. This allowed for us to compare the data that we found from each interactive graphs. For instance, comparing the most popular video game in a certain along with their most committed crime."),
  h2("What Conclusions Did We Come Up With From Our Research?"),
  p("- There is no clear indication of video games influencing individuals to become criminals because despite the type of video game that was most played in a state, the types of crimes that were most committed was still the same."),
  p("- There was however a connection between the most popular video games and the total number of crimes committed. A state that had a video game that was more similar to crime had higher total number of crimes committed compare to a state that didn't."),
  p("- Despite states all varying in total number of crimes, there was a trend in that every state's top committed crimes were theft and assault")

)

report_ui <- fluidPage(
  h1("Is Video Games the Cause of Crimes?"),
  p("Code Name: Video Game Criminals"),
  p("Authors: Truong Le (truongle@uw.edu), Jerry Tang (Jertang@uw.edu), Jesse Kim(jkim1224@uw.edu)"),
  p("Affiliation: INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  p("Autumn 2022"),
  
  h2("Abstract"),
  p("Our main question is whether there is a correlation between video games and crime rates. This question is important because for years, people have been saying that if you play video games, you are likely to be a criminal. To address the question, we will be looking at data from each year for the United States, the most popular games and the amount of crimes committed. We are concerned with different factors that will contribute to the amount of crimes. To address this, we will look at the type of crimes that were committed, while also looking at the genre of games that are being played most each year to compare whether there is a correlation."),
  
  p("Keywords: Video games/ Crime/ Correlation/ Violence/ Confounding"),
  
  h2("Introduction"),
  p("For years, people have associated playing video games to violence, believing that people who play video games are more likely to become criminals. This has piqued the interest of the research topic of “is video games a cause of crime rates?” To answer this question, we will have to look at two types of data. The first being the number of crimes that occurred in each year in the United States. The second is the most popular game each year. With this data, we will be able to see if the genre of the game will have a factor in the number of crimes."),
  
  h2("Problem Domain"),
  p("Background: As a group collectively, we like to play games whether that be first-person shooters or party games on the Nintendo Switch. And recently there have been a lot of shootings and criminal activity that has been happening near the UW campus. We have all also heard that violent video games may cause an increase in violent behaviors in a person. So we were wondering if the violence from video games had any impact on whether that person affected by video games would commit a crime."),
  p("Direct and Indirect Stakeholders: The stakeholders in our situation are adolescents and the general public. In this case, adolescents are a direct stakeholder because the majority of the player base for most video games is adolescents. So they are the generation that is most susceptible to the violence that is in video games. Which can rub off into their personalities and potentially make them more violent. An indirect stakeholder in our project is the general public. The general public is a stakeholder because they will be the ones that are affected by the crimes that people make. People with very violent personalities and tendencies are more likely to commit crimes and hurt others."),
  p("Human Values: With our research project we would like to create a safer environment in our community and see if there is a potential link between video games and crime rates. We would like to help our community by creating a visual diagram and report our findings about video games and their impact on violence and crime rates in our community."),
  p("Potential Benefits and Harms: Some potential benefits from our project would be to inform other people about video games and if there is a correlation between them with increased violence in a person. This way people are more informed about video games and increased violence in adolescents. A potential harm is that if we find a strong correlation between video games with increased violence and crimes, we might be stereotyping all people that play games as people that are violent and criminals. We may create a stigma against video games and gamers, which is something we would like to refrain from doing."),
  
  h2("Research Questions: "),
  
  p("- What is the most popular game each year in the United States?"),
  p("This is an important question to ask because not every game is a violence game. If we are able to see what the most popular game is each year, we are able to look at the genre of the game to see whether there is a correlation between the type of game that is being played and crimes."),
  
  p("- How many crimes are committed in the United States?"),
  p("We need to look at the amount of crimes in the United States because that is where the most attention is focused on on news outlets and researches. If there is an association between crimes and video games, we will see an increase in crime when."),
  
  p("- What type of crimes are most committed?"),
  p("This question should be asked because we need to see if the type of crimes that are committed is associated with the type of games that are being played the most. With this type of information, we are able to see whether video games are igniting the fuel to commit crimes, or that the type of crime that is being committed is taught by the video games they played."),
  
  h2("Dataset: "),
  p("Our dataset is collected by two organizations. The crime datas are collected by the “Federal Bureau of Investigation.” The video games data are collected by the organization NPD, a market research organization. The crime data is funded by taxes. However, NPD is funded by industries. The people who benefit the most through NPD are the industries who funded NPD, while crime data benefits the government officials. The datas are held secure and validated because higher up rely on the data to be accurate to use. For NPD, it is these big industries that rely on the data, for crime data, it is the government officials. We believe that the data are credible because the companies are being paid to give accurate data for the industries, helping the industry see what they are doing is working or not. We obtained the data through their respective websites"),
  
  h2("Findings:"),
  p("- The state Texas had the highest number of total crimes committed while their most popular video game statewide was Grand Theft Auto V, a notorious video game about crimes."),
  p("- Every state in the United States had their two highest committed crimes being assault and theft."),
  p("- Despite every state having theft and assault as their most committed crimes, the type of video game that was most popular were not all very similar. Each had different video games that was most popular despite having the same most committed crimes."),
  p("- Every state had similar statistics for total number of crimes committed except for Texas."),
  
  h2("Discussion: "),
  p("When doing our research, we were able to see many trends throughout the states in the United. When comparing the total number crimes committed through our scatter plot, we are able to see that every state were clsoe to each other in total number of crimes committed without Texas being the only state that had a big gap. Despite this, we were not able to see any correlation between the total number of crimes committed and the most played video games in each state. When comparing the most popular video game in Texas and the other states, for instance, Illinoise and Arizona. Both of the states had 'Grand Theft Auto V' as their most played video game, however, none of the two state had total number of crimes committed close to Texas. Through our research, we were able to also see that every state had similar statistic when looking at the two highest committed crimes. However, when we compare the highest committed crimes of each state to their most popular video game, we are not able to see any trend because although some states had video games that were similar to the crimes committed, there were many states that didn't have their most popular video game being similar to the type of crime that was committed. But what does all of our research tell us about our data? We found out that there was no clear connection that video games influence individuals to become criminals. However, from our research, it has created a new research that will further develop our original research. From our research, we are able to see that there was a correlation total number of crimes committed and the type of video game that was played. This makes us question whether criminals enjoy playing video games, specifically crime related ones to pique their interests in crimes or find methods of how to commit crimes."),
  
  h2("Conclusion: "),
  p("From our experiment, we want individuals like us to realize that we should not always trust the information that is presented to us. Despite news outlet creating this theory that video games creates criminals, we were not able to find a correlation that proves this theory right. However, we are able to see that there was a trend between each state in total number of crimes committed because every state were fairly close to each other in total number of crimes committed. Another trend was that each state had the same data of the type of crime that was most committed. The two highest committed crimes in each states were theft and assault. Because there was no clear correlation between video games, total number of crimes committed, and the type of crimes that were committed, as a group we have decided to claim that video games is not a factor of an individual becoming a criminal. Because our research is focused on video games, which is a limitation of ours, we are not able to find the factor that makes an individual become a criminal."),
  
  h2("References: "),
  tags$footer("Federal Bureau of Investigation. \"Crimes Against Persons Offenses.\" Retrieved October 30, 2022. From:",
              tags$a(
                "https://crime-data-explorer.fr.cloud.gov/pages/home",
                target = "_blank",
                href = "https://crime-data-explorer.fr.cloud.gov/pages/home")
  ),
  
  tags$footer("Federal Bureau of Investigation. \"Crimes Against Society Offenses.\" Retrieved October 30, 2022. From: ",
              tags$a(
                "https://crime-data-explorer.fr.cloud.gov/pages/home",
                target = "_blank",
                href = "https://crime-data-explorer.fr.cloud.gov/pages/home")
  ),
  
  tags$footer("Federal Bureau of Investigation. \"Crimes Against Propoerty Offenses.\" Retrieved October 30, 2022. From: ",
              tags$a(
                "https://crime-data-explorer.fr.cloud.gov/pages/home",
                target = "_blank",
                href = "https://crime-data-explorer.fr.cloud.gov/pages/home")
  ),
  
  tags$footer("Grubb, Jeff. \"NPD: The 20 best-selling games of 2019 in the U.S.\" Retrieved October 30, 2022. From: ",
              tags$a(
                "https://venturebeat.com/games/20-best-selling-games-of-2019",
                target = "_blank",
                href = "https://venturebeat.com/games/20-best-selling-games-of-2019")
  )
)

# Final webpage layout
ui <- navbarPage(
  title = "Video Games Criminals",
  tabPanel("Introductory ", introduction),
  tabPanel("Number of Offenses", scatter_ui),
  tabPanel("Rates", bar_ui),
  tabPanel("Most Popular Video Games", map_ui),
  tabPanel("Findings", takeaway_ui),
  tabPanel("Report", report_ui)
)


  

