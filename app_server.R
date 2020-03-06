server <- function(input, output) {
  output$out_message <- renderText({
    msg <- paste0("Hi there, ", input$username, "!")
    return(msg)
  })
}