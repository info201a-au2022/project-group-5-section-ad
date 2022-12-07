
# Referencing table summary
source("./source/table_summary.R")

library(ggplot2)

# Creates a scatterplot that compares each states and their total offenses
# Plots dots, color coded for each states
scatter_offenses <- ggplot(crimes_table, aes(x = State, y = Total_Offenses, col = State)) +
  labs(title = "States vs Total Offenses") + 
  geom_point()
scatter_offenses
