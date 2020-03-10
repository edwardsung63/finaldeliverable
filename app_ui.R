library(ggplot2)

main <- fluidPage(
  h1("Hello App"),
  textInput(
    inputId = "username",
    label = h3("Type in your name")
  ),
  textOutput(outputId = "out_message")
)
########################################
########################################
tab_1_options <- sidebarPanel(
  selectInput(
    "mapvar",
    label = "Age Group",
    choices = list(
      "Ages 4+" = "4",
      "Ages 9+" = "9",
      "Ages 12+" = "12",
      "Ages 17+" = "17"
    )
  ),
  selectInput(
    "test",
    label = "Appstore Selection",
    choices = list(
      "Google" = "google",
      "Apple" = "apple"
    )
  )
)

tab_1_main <- mainPanel(
  plotlyOutput("pie")
)

tab_1 <-  sidebarLayout(
    tab_1_options,
    tab_1_main
  )
########################################
########################################
tab_2_content <-
tab_2_main <- 
tab_2 <- sidebarLayout(
  tab_2_content,
  tab_2_main
)
########################################
########################################
library(shinythemes) 
ui <- fluidPage(
  theme = shinytheme("superhero"),
  navbarPage("INFO 201 Final",
    tabPanel("Main table", main),
    tabPanel("Pie Chart", tab_1),
    tabPanel("Histogram", tab_2)
    )
)


