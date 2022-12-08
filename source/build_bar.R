library("tidyverse")
library("dplyr")
library("ggplot2")
library("stringr")

# Build Bar Plot Function
build_bar <- function(data, input) {
  new_data <- data %>% 
    filter(State == input) %>% 
    select(-Video.Games) %>% 
    gather()
  new_data <- new_data[-26,]
  new_data <- new_data[-19,]
  new_data <- new_data[-1,]
  new_data$value = as.numeric(new_data$value)
  plot <- ggplot(new_data, aes(key, value, col = key, 
                               text = paste("State: ", new_data$key, "<br>", 
                               "Rates of Crimes: ", prettyNum(new_data$value,big.mark=",",scientific=FALSE)))) +
    geom_col() +
    scale_y_continuous(limits = c(0, max(new_data$value))) +
    theme(axis.text.x = element_blank()) + 
    labs(color='Types of Crimes', 
         title = paste("Rates of Different Crimes in", input, sep = " "),
                                                x = "Types of Crimes", y = "Rates of Crimes")
    
  return(ggplotly(plot, tooltip = c("text")))
}
