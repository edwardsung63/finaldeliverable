tab_1 <- sidebarLayout(
  sidebarPanel(h1("This is a main sidebar")),
  mainPanel(h1("This is the main panel"))
)

main <- fluidPage(
  h1("Hello App"),
  textInput(
    inputId = "username",
    label = h3("Type in your name")
  ),
  textOutput(outputId = "out_message")
)

ui <- navbarPage("INFO 201 Final",
  tabPanel("Main table", main),
  tabPanel("tab 1", tab_1),
  tabPanel("tab 2", h1("test tab 2"))
)


