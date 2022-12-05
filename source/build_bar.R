library("tidyverse")
library("dplyr")
library("ggplot2")

# Build Bar Plot Function
build_bar <- function(data, input) {
  new_data <- data %>% 
    filter(State == input) %>% 
    select(-Video.Games) %>% 
    gather()
  new_data <- new_data[-1,]
  new_data <- new_data[-24,]
  new_data$value = as.numeric(new_data$value)
  plot <- ggplot(new_data, aes(key, value, col = key)) +
    geom_col() +
    scale_y_continuous(limits = c(0, max(new_data$value))) +
    theme(axis.text.x = element_blank())
  return(plot)
}

