library(shiny)

source("chart_three.R")
source("app_server.R")
source("app_ui.R")

shinyApp(ui = ui, server = server)