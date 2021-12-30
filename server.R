library(dplyr)
library(tidyr)


shinyServer(function(input, output) {
  
  White= percent_map(counties$white, "darkblue", "% White")
  Black= percent_map(counties$black, "darkgreen", "% Black")
  Hispanic= percent_map(counties$hispanic, "darkred", "% Hispanic")
  Asian= percent_map(counties$asian, "black", "% Asian")

    output$map <- renderPlot({
      data<- switch(input$var,
                    "White percentage" = counties$white, 
                    "Black percentage" = counties$black,
                    "Hispanic percentage" = counties$hispanic,
                    "Asian percentage" = counties$asian)
      
      Color<- switch(input$var,
                     "White percentage" = "darkblue", 
                     "Black percentage" = "darkgreen",
                     "Hispanic percentage" = "darkred",
                     "Asian percentage" = "black")
      
      Legend<- switch(input$var,
                      "White percentage" = "% White", 
                      "Black percentage" = "% Black",
                      "Hispanic percentage" = "% Hispanic",
                      "Asian percentage" = "% Asian")
      
      percent_map(
        var = data,
        color = Color,
        legend.title = Legend,
        max = input$range[],
        min = input$range[]
      )
      
    })

})

