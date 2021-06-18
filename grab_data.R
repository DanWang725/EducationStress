library(tidyverse)
library(rvest)


raw_data <- read_csv("responses.csv")
raw_data

clean_data <- raw_data %>% 
  select(Age,`Before-Environment`, `Now-Environment`,`Before-HomeworkStress`,`Now-HomeworkStress`)
