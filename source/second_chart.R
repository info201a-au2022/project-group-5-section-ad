

source("~/Documents/info201/Project/project-group-5-section-ad/source/table_summary.R")

library(ggplot2)

scatter_offenses <- ggplot(crimes_table, aes(x = State, y = `Total Offenses`, col = State)) +
  labs(title = "States vs Total Offenses") + geom_point()
scatter_offenses

