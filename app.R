library(shiny)
library(ggplot2)
library(shinythemes)

source("scripts/chart_three.R")
source("app_server.R")
source("app_ui.R")

shinyApp(ui = ui, server = server)