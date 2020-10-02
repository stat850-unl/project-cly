library(dplyr)
library(tidyr)
d1 <- read.csv("food_component.csv")
d2 <- read.csv("food_nutrient.csv")
d3 <- read.csv("market_acquisition.csv")
d4 <- read.csv("sub_sample_result.csv")
d <- inner_join(d1,d2,by = "fdc_id") # This results in 6300 observarions of 18 variables
dd <- inner_join(d3,d1,by = "fdc_id") # 2982 obs with 20 variables

