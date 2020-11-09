library(dplyr)
library(tidyr)
library(ggplot2)
food_component <- read.csv("food_component.csv")
food_nutrient <- read.csv("food_nutrient.csv")
nutrient <- read.csv("nutrient.csv")
food_component_nutrient <- inner_join(food_component,food_nutrient,by = "fdc_id") # This results in 6300 observarions of 18 variables
food_component_nutrient <- inner_join(food_component_nutrient, nutrient, by= c("nutrient_id"="id") ) # add the nutrient name instead of nutrient id
food_dataset <- food_component_nutrient[,c(3,4,5,6,11,14,15,16,19,20)] # the "food nutrient of food component" analysis
col_names <- c("component_name","pct_weight","is_refuse","gram_weight","nutrient_amount","min","max","median","nutrient_name","nutrient_unit")
colnames(food_dataset) <- col_names
food_dataset <- food_dataset[,c(1,2,3,4,9,5,6,7,8,10)]
food_dataset <- food_dataset %>% mutate(nutrition_amount_in_component= nutrient_amount/100*gram_weight)  

if ( food_dataset$nutrient_unit == 'MG') {
  food_dataset$nutrition_amount_in_component = food_dataset$nutrition_amount_in_component/ 1000
} else if ( food_dataset$nutrient_unit == 'UG') { 
  food_dataset$nutrition_amount_in_component = food_dataset$nutrition_amount_in_component/1000000
} else if ( food_dataset$nutrient_unit == 'KCAL') {
  food_dataset$nutrition_amount_in_component = food_dataset$nutrition_amount_in_component* 4.184
}

unit<- sub("MG",  "G", food_dataset$nutrient_unit) 
unit<- sub("UG",  "G", unit)
unit<- sub("KCAL",  "kJ", unit)
food_dataset <- food_dataset %>% replace(., "nutrient_unit", c(unit)) %>% unite(., "nutrient_name_nutrient_unit", nutrient_name, nutrient_unit)


ui <- fluidPage(
  
  titlePanel("Nutrient in Refused Component"),
  
  sidebarPanel(
    selectInput("nutrient_name_nutrient_unit", "Nutrient", choices = sort(unique(food_dataset$nutrient_name_nutrient_unit)), selected = "Cholesterol"),
  hr(),
  helpText("Data from U.S. DEPARTMENT OF AGRICULTURE (USDA), Agricultural Research Service (2020)")
), 
  
  mainPanel(
    tabsetPanel(
      tabPanel("Nutrient plot", plotOutput("nutrient")),
      tabPanel("Weighted nutrient", plotOutput("weighted"))
    )
  )
)

server <- function(input, output) {
  
  nutrient_subset <- reactive({
    food_dataset %>% 
      filter(nutrient_name_nutrient_unit == input$nutrient_name_nutrient_unit)
  })
  
  # Fill in the spot we created for a plot
  output$nutrient <- renderPlot({
    
    ggplot(data = nutrient_subset(), aes(x = component_name, y = nutrition_amount_in_component)) +
      xlab("component name") +
      ylab("nutrient amount") +
      #scale_y_discrete(limits = as.character(input$ingredient))+
      geom_col() +
      theme_bw() +
      coord_flip() +
      ggtitle(paste("Amount of", input$nutrient_name_nutrient_unit, "Reports by Refused Component"))
  })
  
  weighted_subset <- reactive({
    food_dataset %>% 
      filter(nutrient_name_nutrient_unit == input$nutrient_name_nutrient_unit) %>% 
      mutate(weighted_nutrient = nutrition_amount_in_component/gram_weight)
  })
  
  output$weighted <- renderPlot({
    ggplot(data = weighted_subset(), aes(x = component_name, y = weighted_nutrient)) +
      xlab("component name") +
      ylab("weighted nutrient amount") +
      geom_col() +
      theme_bw() +
      coord_flip() +
      ggtitle(paste("Amount of", input$nutrient_name, "Reports by Refused Component"))
  })
}
shinyApp(ui, server)

