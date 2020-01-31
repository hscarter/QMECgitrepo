#Exploring the data

library(tidyverse)

data <- read.csv("indProject/RouseMatingEvents.csv")
str(data)
comparison <- data %>% 
  group_by(linalool.y) %>% 
  summarise(matChem = sum(linalool.x), meanDist = mean(dist_m), sd = sd(dist_m))
table(data$linalool.y)
countPat <- c(18, 30)
comparison$propL <- comparison$matChem/countPat
comparison$se <- comparison$sd/sqrt(countPat)
comparison #now has the number of linalool producing maternal plants visited 
#by the different patenal chemotypes, the proportion, and mean distance traveled
#from paternal to maternal plants from each group with sd and st error
