#Bar Chart for total offenses per state

source("./source/table_summary.R")

library(ggplot2)

df <- data.frame(states = crimes_table$State, 
                   total_offenses = crimes_table$Total_Offenses)

plot <- ggplot(df, aes(x = states, y = total_offenses)) + 
  geom_bar(stat = "identity") +
  labs(title = "Bar Plot: States vs Total Offenses")

plot
