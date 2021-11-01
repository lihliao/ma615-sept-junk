options(scipen = 6, digits = 4)
memory.limit(30000000) 

if (!require("pacman")) install.packages("pacman")
pacman::p_load("tidyr","tidyverse", "dplyr","ggplot2")
ggfun <- function(dat, x.var, y.var){
  
  p <- ggplot(data = dat,
                aes(x = x.var,y = y.var)) +
    geom_point()+
    geom_smooth(formula = y~x)
  
  return(p)
}


# you did a really nice job, I learn a lot from you. But I think you can add a smooth line in your plot and make it colorful
#which can make the graph much more attractive

