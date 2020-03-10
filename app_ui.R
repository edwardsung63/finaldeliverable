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
    "age_group",
    label = "Age Group",
    choices = list(
      "Ages 4+" = "4",
      "Ages 9+" = "9",
      "Ages 12+" = "12",
      "Ages 17+" = "17"
    )
  ),
  selectInput(
    "app_store",
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
tab_2_content <- sidebarPanel(
  radioButtons(
    inputId = "app_store_2",
    label = h3("Which app store?"),
    choices = list(
      "Apple" = "apple", "Google" = "google"
    )
  ),
  numericInput("count", "Categories with more than:", 1, min = 1, max = 30000)
)
tab_2_main <- mainPanel(
  plotlyOutput("histogram")
)
tab_2 <- sidebarLayout(
  tab_2_content,
  tab_2_main
)
########################################
########################################
# tab_3_content <- sidebarPanel(
#   radioButtons(
#     inputId = "xx",
#     label = h3("radio buttons"),
#     choices = list(
#       "A" = 1, "B" = 2, "C" = 3
#     )
#   ),
#   selectInput("selection",
#               label = h3("select box"),
#               choices = list(
#                 "1" = 1
#               ),
#               selected = 1)
# )
# tab_3_main <- mainPanel(
#   plotOutput("histogram")
# )
# tab_3 <- sidebarLayout(
#   tab_3_content,
#   tab_3_main
# )
########################################
########################################
library(shinythemes) 
ui <- fluidPage(
  theme = shinytheme("superhero"),
  navbarPage("INFO 201 Final",
    tabPanel("Main table", main),
    tabPanel("Pie Chart", tab_1),
    tabPanel("Histogram", tab_2)
    #tabPanel("Scatterplot", tab_3)
    )
)


