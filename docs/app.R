#install.packages('rsconnect')

#rsconnect::setAccountInfo(name='tuhrong', token='1697A611241183D99C4FF46959BD59DB', secret='c43X8qx/Nn5IOgUR9jNNpWNOLhBztZP3tLU+1r2q')

library("rsconnect")
#rsconnect::deployApp('../../project-group-5-section-ad/docs/app.R')

# Shiny app
library("shiny")

# Executes the `app_ui.R` and `app_server.R` files.
source("app_ui.R")
source("app_server.R")

# Create a new shinyApp using the `ui` and `server` variables
shinyApp(ui = ui, server = server)