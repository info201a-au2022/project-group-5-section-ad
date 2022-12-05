library("tidyverse")
library("dyplr")
library("ggplot2")

# Build Bar Plot Function
build_bar <- function(data, input_state) {
  new_data <- data %>% 
    filter(State == input_state) %>% 
    select(-Video.Games)
}

jk <- crimes_table

jk <- jk %>% 
  filter(State == "Washington") %>% 
  select(-Video.Games)
jk <- jk %>% 
  select(-State)

plot(rev(stack(jk)))
