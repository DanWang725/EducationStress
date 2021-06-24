library(tidyverse)
library(rvest)
library(janitor)
library(ggdist)

raw_data <- read_csv("responses.csv") %>% 
  clean_names()
raw_data

col_names <- c("environment","classwork_stress","homework_stress","homework_hours")

# clean_data <- raw_data %>% 
#   select(before_homework_stress, now_homework_stress,
#          before_environment, now_environment,
#          before_classwork_stress,now_classwork_stress) %>% 
#   group_by(before_environment, now_environment) %>% 
#   pivot_longer(names_to = "time_frame", values_to = "environment",
#                cols = c(before_environment,now_environment))
# 
# intermed_data <- raw_data %>% 
#   select(before_homework_hours, before_classwork_stress, before_environment) %>% 
#   rename(homework_hours = before_homework_hours,
#          classwork_stress = before_classwork_stress,
#          environment = before_environment) %>% 
#   mutate(time_frame = "before")
  

before <- raw_data %>% 
  select(contains("before"), gender) %>% 
  #rename() %>% 
  mutate(time_frame = "before")


after <- raw_data %>% 
  select(contains("now"), gender) %>% 
  #set_names(col_names) %>% 
  mutate(time_frame = "after")


colnames(before)<-gsub("before_","",colnames(before))
colnames(after)<-gsub("now_","",colnames(after))


clean_data <- bind_rows(list(before,after))
  
write_csv(clean_data, "clean_data.csv")


# data_test %>% 
#   ggplot(aes(x = change, y = relationship_type))+
#   stat_halfeye()
# 
# data_test %>% 
#   ggplot(aes(x = change_hwk_stress, y = family_relationships))+
#   geom_jitter()
# 
# clean_data %>% 
#   ggplot(aes(x = stress, color = time_frame))+
#   geom_bar()+
#   facet_wrap(~time_frame)
#   mutate(`Time-Frame` = if_else(`Time-Frame` == "Before-Environment", "Before_Covid", "After-Covid"))

  