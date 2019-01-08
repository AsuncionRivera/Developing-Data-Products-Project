
library(shiny)

shinyUI(fluidPage(
  titlePanel("SALES SCORECARD"),
  
  sidebarLayout(
    sidebarPanel(
       selectInput("variable", "Display Sales for the Year : ", c("2017" = "YR2017",
                                              "2018" = "YR2018"))
    ),
    mainPanel(
       tableOutput("data")
       
    )
  )
))
