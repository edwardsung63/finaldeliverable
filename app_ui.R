ui <- navbarPage(tabPanel("Main tab", h1("Main page")),
                 tabPanel("tab 1", h1("test tab 1")),
                 tabPanel("tab 2", h1("test tab 2"))
)

# ui <- fluidPage(
#   h1("Hello App"),
#   textInput(
#     inputId = "username",
#     label = h3("Type in your name")
#   ),
#   textOutput(outputId = "out_message")
# )

