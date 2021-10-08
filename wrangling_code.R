options(scipen = 6, digits = 4)
memory.limit(30000000) 

if (!require("pacman")) install.packages("pacman")
pacman::p_load("tidyr","tidyverse", "dplyr","data.table", "zoo","rstudioapi")



income <- as_tibble(read.csv("income_per_person_gdppercapita_ppp_inflation_adjusted.csv", fileEncoding = 'UTF-8-BOM')) 
co2 <- as_tibble(read.csv("co2_emissions_tonnes_per_person.csv", fileEncoding = 'UTF-8-BOM'))

income_long <- income %>% 
  mutate_if(is.numeric,as.character, is.factor, as.character) %>% 
  pivot_longer(X1799:X2049, names_to = "year", values_to = "income_capita") %>%
  mutate(year = as.integer((gsub("X","", year)))) 

co2_long <- co2 %>% #
  mutate_if(is.numeric,as.character, is.factor, as.character) %>% 
  pivot_longer(-country, names_to = "year", values_to = "co2_capita")%>%
  mutate(year = as.integer((gsub("X","", year))))  


agg_df = full_join(x=income_long,y=co2_long,by=c("country","year"))



