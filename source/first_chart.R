#Bar Chart for total offenses per state

source("~/Documents/info201/project-group-5-section-ad/source/table_summary.R")

library(ggplot2)

df <- data.frame(states = crimes_table$State, 
                   total_offenses = crimes_table$Total_Offenses)

plot <- ggplot(df, aes(x = states, y = total_offenses)) +
  lab(title = "States vs Total Offenses") + 
  geom_bar(stat = "identity")
plot
