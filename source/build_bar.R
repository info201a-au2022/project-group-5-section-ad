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
  select(-Video.Games) %>% 
  gather()
<<<<<<< HEAD
ggplot(jk, aes(key, value)) + geom_col() + scale_y_continuous(breaks = seq(0, 500000, len = 50))
                                                              
=======
jk <- jk[-1,]
jk <- jk[-24,]
jk$value=as.numeric(jk$value)
View(jk)
ggplot(jk, aes(key, value)) + geom_col() + scale_y_continuous(limits = c(0, 500000))
                                                              
>>>>>>> 27d4558a60cc1723ae8e02b1c72eac6aac448453
