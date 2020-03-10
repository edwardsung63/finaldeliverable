library(shiny)
library(ggplot2)
library(shinythemes)

source("scripts/sum_table.R")
source("app_server.R")
source("app_ui.R")

shinyApp(ui = ui, server = server)