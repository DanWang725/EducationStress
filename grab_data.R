library(tidyverse)
library(rvest)
library(janitor)

raw_data <- read_csv("responses.csv") %>% 
  clean_names()
raw_data

clean_data <- raw_data %>% 
  select(before_homework_stress, now_homework_stress) %>% 
  pivot_longer(names_to = "time_frame", values_to = "stress", cols = before_homework_stress:now_homework_stress)
  

clean_data %>% 
  ggplot(aes(x = stress, color = time_frame))+
  geom_bar()+
  facet_wrap(~time_frame)
  #pivot_longer(names_to = "Time-Frame", values_to = "Environment",
  #             cols = c(`Before-Environment`, `Now-Environment`)) %>% 
  #mutate(`Time-Frame` = if_else(`Time-Frame` == "Before-Environment", "Before_Covid", "After-Covid"))

  