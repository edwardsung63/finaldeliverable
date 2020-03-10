library(plotly)
library(ggplot2)

server <- function(input, output) {
  output$out_message <- renderText({
    msg <- paste0("Hi there, ", input$username, "!")
    return(msg)
  })
  
  output$pie <- renderPlotly({
    test <- pie_function(input$test, input$mapvar)
    return(test)
  })
  output$histogram <- renderPlot({
    #chart 1
  })
}