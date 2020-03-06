ui <- fluidPage(
  h1("Hello App"),
  textInput(
    inputId = "username",
    label = h3("Type in your name")
  ),
  textOutput(outputId = "out_message")
)