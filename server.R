
library(shiny)


sales_data = read.csv("salestotal.csv", na.strings=c("", "NA"))

shinyServer(function(input, output) {
  output$data <- renderTable({
    sales_data[, c("MONTH", input$variable), drop = FALSE]
  }, rownames = TRUE)
  
  
})
