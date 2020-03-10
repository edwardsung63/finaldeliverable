library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(ggpubr)

source("./scripts/app_cleaned.R")
source("./scripts/google_cleaned.R")

age_rating_apple <- apple_cleaned %>%
  group_by(new_content_rating, Category) %>%
  summarise(amount_spent = sum(as.numeric(price), na.rm = TRUE))

apple_rating_4 <- age_rating_apple %>% filter(new_content_rating == "4")
apple_rating_9 <- age_rating_apple %>% filter(new_content_rating == "9")
apple_rating_12 <- age_rating_apple %>% filter(new_content_rating == "12")
apple_rating_17 <- age_rating_apple %>% filter(new_content_rating == "17")

age_rating_google <- google_cleaned %>%
  group_by(new_content, Category) %>%
  summarise(amount_spent = sum(price, na.rm = TRUE))

google_rating_4 <- age_rating_google %>% filter(new_content == 4)
google_rating_9 <- age_rating_google %>% filter(new_content == 9)
google_rating_12 <- age_rating_google %>% filter(new_content == 12)
google_rating_17 <- age_rating_google %>% filter(new_content == 17)

pie_function <- function(app_store, age_group) {
  if (age_group == "4" && app_store == "google") {
    data <- google_rating_4
  } else if (age_group == "9" && app_store == "google") {
    data <- google_rating_9
  } else if (age_group == "12" && app_store == "google") {
    data <- google_rating_12
  } else if (age_group == "17" && app_store == "google") {
    data <- google_rating_17
  } else if (age_group == "4") {
    data <- apple_rating_4
  } else if (age_group == "9") {
    data <- apple_rating_9
  } else if (age_group == "12") {
    data <- apple_rating_12
  } else if (age_group == "17") {
    data <- apple_rating_17
  }
  fig <- plot_ly(data, labels = ~Category, values = ~amount_spent, type = 'pie', textposition = "inside", name = "4+")
  fig <- fig %>% layout(title = paste0("Spending habits of people ", age_group, "+"),
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

return(fig)
}
