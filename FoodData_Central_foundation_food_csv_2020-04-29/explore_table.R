library(dplyr)
library(tidyr)
food_component <- read.csv("food_component.csv")
food_nutrient <- read.csv("food_nutrient.csv")
market_acquisition <- read.csv("market_acquisition.csv")
sub_sample_result <- read.csv("sub_sample_result.csv")
nutrient <- read.csv("nutrient.csv")
lab_method <- read.csv("lab_method.csv")
sub_sample_result <- read.csv("sub_sample_result.csv")
d <- inner_join(food_component,food_nutrient,by = "fdc_id") # This results in 6300 observarions of 18 variables
d <- inner_join(d, nutrient, by= c("nutrient_id"="id") ) # add the nutrient name instead of nutrient id
newd <- d[,c(3,4,5,6,11,14,15,16,19,20)] # the "food nutrient of food component" analysis
dd <- inner_join(market_acquisition,food_component,by = "fdc_id") # 2982 obs with 20 variables


data <- inner_join(lab_method, sub_sample_result, by =c("id"="lab_method_id")) #common lab methods (techniques) that are used to analyze the nutrient
data <- data %>% inner_join( food_nutrient, by= c("food_nutrient_id"="id")) %>% 
             inner_join( nutrient, by=c("nutrient_id" = "id"))
newdata <- data[,c(2,3,5,6,10,12,13,14,17,18)] 
#fist two columns are lab methods
#data_points in food nutrient means "Number of observations on which the value is based"
#the lab_methods summary based on food nutrient analysis
