counties<- readRDS('data/counties.rds')
head(counties)


library(maps)
library(mapproj)

source('helpers.R')



library(shiny)
library(shinythemes)
library(shinyjs)


shinyUI(fluidPage(
    
    titlePanel("Census Visulization"),

    sidebarLayout(
        sidebarPanel(
            
            helpText("Creating Demographic map of USA 2010 Census"),
            
            selectInput("var",
                        label = "Select one category",
                        choices = c("White percentage", "Black percentage",
                                   "Hispanic percentage", "Asian percentage"),
                        selected = "White percentage"),
            
            sliderInput("range",
                        label = "Range of interest",
                        min = 0, max = 100, value = c(0,100)),
        
            
        ),
        
        mainPanel(
            plotOutput("map")
        )
    )
))



