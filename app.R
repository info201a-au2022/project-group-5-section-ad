#install.packages('rsconnect')
# Shiny app
library("shiny")

library("rsconnect")
#rsconnect::setAccountInfo(name='tuhrong', token='14BA7A318BEF05AB410835E1D78BAB61', secret='9sGyy6bMnQj0EDBzOPMcd2AEjNKKNwWxnI7UCXag')
#rsconnect::deployApp()

# Executes the `app_ui.R` and `app_server.R` files.
source("app_ui.R")
source("app_server.R")

# Run the application 
shinyApp(ui = ui, server = server)
