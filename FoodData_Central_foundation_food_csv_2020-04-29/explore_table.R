
ui <- fluidPage(
  
  titlePanel("Nutrient in Refused Component"),
  
  sidebarPanel(
    selectInput("nutrient_name_nutrient_unit", "Nutrient", choices = sort(unique(food_dataset$nutrient_name_nutrient_unit)), selected = "Cholesterol"),
  hr(),
  helpText("Data from U.S. DEPARTMENT OF AGRICULTURE (USDA), Agricultural Research Service (2020)")
), 
  
  mainPanel(
    tabsetPanel(
      tabPanel("Nutrient plot", plotOutput("nutrient"))
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
}
shinyApp(ui, server)

