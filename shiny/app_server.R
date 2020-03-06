library(plotly)
##("./scripts/chart_three.R")

server <- function(input, output) {
  output$out_message <- renderText({
    msg <- paste0("Hi there, ", input$username, "!")
    return(msg)
  })
  
  output$pie <- renderPlotly({
    test <- pie_function(google_rating_4, mapvar)
    return(test)
  })
}