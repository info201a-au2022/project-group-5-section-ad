#install.packages('rsconnect')
# Shiny app
library("shiny")

library("rsconnect")
#rsconnect::setAccountInfo(name='tuhrong', token='0D9738F96069EFFB72A9CC50CB18A6F9', secret='n4crwVmURPv48eZQeDbgyIsm9lZWfmcDlJ8XUcYI')
#rsconnect::deployApp()

# Executes the `app_ui.R` and `app_server.R` files.
source("app_ui.R")
source("app_server.R")

# Run the application 
shinyApp(ui = ui, server = server)
