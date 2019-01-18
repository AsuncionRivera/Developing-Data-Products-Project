
library(shiny)


shinyUI(fluidPage(
  titlePanel("SALES SCORECARD & TARGET SETTING"),
  
  
  
  sidebarLayout(
    sidebarPanel(
       selectInput("variable", "Display Sales for the Year : ", c("2017" = "YR2017",
                                              "2018" = "YR2018")),
       textInput("box1", "Enter % Increase : ", value = "Tab1")
    ),
    mainPanel(
      
       tabsetPanel(
                   tabPanel("SALES", br(), tableOutput("data")),
                   tabPanel("TARGET SETTING",  br(), wellPanel("EOP Sales is 786202. With the desired % increase of", 
                                                               textOutput("out1"), "the 2019 EOP Target is :", 
                                                               textOutput("calc_target")))
                                                               
                   
                   )
  )
  )
))
