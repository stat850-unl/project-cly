library(dplyr)
library(tidyr)
food_component <- read.csv("food_component.csv")
food_nutrient <- read.csv("food_nutrient.csv")
nutrient <- read.csv("nutrient.csv")
food_component_nutrient <- inner_join(food_component,food_nutrient,by = "fdc_id") # This results in 6300 observarions of 18 variables
food_component_nutrient <- inner_join(food_component_nutrient, nutrient, by= c("nutrient_id"="id") ) # add the nutrient name instead of nutrient id
food_dataset <- food_component_nutrient[,c(3,4,5,6,11,14,15,16,19,20)] # the "food nutrient of food component" analysis
col_names <- c("component_name","pct_weight","is_refuse","gram_weight","nutrient_amount","min","max","median","nutrient_name","nutrient_unit")
colnames(food_dataset) <- col_names
food_dataset <- food_dataset[,c(1,2,3,4,9,5,6,7,8,10)]
write.csv(x = food_dataset, file = "food_dataset.csv")