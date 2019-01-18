
library(shiny)


sales_data = read.csv("salestotal.csv", na.strings=c("", "NA"))
Sales <- as.numeric(sales_data$NEWINSTALL)


shinyServer(function(input, output) {
  
  output$data <- renderTable({
    sales_data[, c("MONTH", input$variable), drop = FALSE]
  }, rownames = TRUE)
  output$out1 <- renderText(input$box1)
  output$out2 <- renderText(input$box2)

  output$calc_target = renderText (786202 * ((as.numeric(input$box1)/100)+1))
  
})
