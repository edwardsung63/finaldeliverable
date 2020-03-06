library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)
library(ggpubr)

source("./scripts/app_cleaned.R")
source("./scripts/google_cleaned.R")

a <- list(
  text = "4+",
  size = 30,
  font = "sans",
  xref = "paper",
  yref = "paper",
  yanchor = "bottom",
  xanchor = "center",
  align = "center",
  x = 0.25,
  y = 0.99,
  showarrow = FALSE
)

b <- list(
  text = "9+",
  size = 30,
  font = "sans",
  xref = "paper",
  yref = "paper",
  yanchor = "bottom",
  xanchor = "center",
  align = "center",
  x = 0.25,
  y = 0.465,
  showarrow = FALSE
)

c <- list(
  text = "12+",
  size = 30,
  font = "sans",
  xref = "paper",
  yref = "paper",
  yanchor = "bottom",
  xanchor = "center",
  align = "center",
  x = 0.75,
  y = 0.99,
  showarrow = FALSE
)

d <- list(
  text = "17+",
  size = 30,
  font = "sans",
  xref = "paper",
  yref = "paper",
  yanchor = "bottom",
  xanchor = "center",
  align = "center",
  x = 0.75,
  y = 0.465,
  showarrow = FALSE
)

age_rating_apple <- apple_cleaned %>%
  group_by(new_content_rating, Category) %>%
  summarise(amount_spent = sum(price, na.rm = TRUE))

apple_rating_4 <- age_rating_apple %>% filter(new_content_rating == "4")
apple_rating_9 <- age_rating_apple %>% filter(new_content_rating == "9")
apple_rating_12 <- age_rating_apple %>% filter(new_content_rating == "12")
apple_rating_17 <- age_rating_apple %>% filter(new_content_rating == "17")

apple_pie <- plot_ly()
apple_pie <- apple_pie %>%
  add_pie(
<<<<<<< HEAD
    data = apple_rating_4, labels = ~Category,
=======
    data = apple_rating_4, labels = ~prime_genre,
>>>>>>> 571443f2a21aec18faf9f25ffe7b154120a6d8ec
    values = ~amount_spent, textposition = "inside", name = "4+",
    domain = list(row = 0, column = 0)
  ) %>%
  layout(annotations = a)
apple_pie <- apple_pie %>%
  add_pie(
<<<<<<< HEAD
    data = apple_rating_9, labels = ~Category,
=======
    data = apple_rating_9, labels = ~prime_genre,
>>>>>>> 571443f2a21aec18faf9f25ffe7b154120a6d8ec
    values = ~amount_spent, textposition = "inside", name = "9+",
    domain = list(row = 0, column = 1)
  ) %>%
  layout(annotations = b)
apple_pie <- apple_pie %>%
  add_pie(
<<<<<<< HEAD
    data = apple_rating_12, labels = ~Category,
=======
    data = apple_rating_12, labels = ~prime_genre,
>>>>>>> 571443f2a21aec18faf9f25ffe7b154120a6d8ec
    values = ~amount_spent, textposition = "inside", name = "12+",
    domain = list(row = 1, column = 0)
  ) %>%
  layout(annotations = c)
apple_pie <- apple_pie %>%
  add_pie(
<<<<<<< HEAD
    data = apple_rating_17, labels = ~Category,
=======
    data = apple_rating_17, labels = ~prime_genre,
>>>>>>> 571443f2a21aec18faf9f25ffe7b154120a6d8ec
    values = ~amount_spent, textposition = "inside", name = "17+",
    domain = list(row = 1, column = 1)
  ) %>%
  layout(annotations = d)
apple_pie <- apple_pie %>% layout(
  title = "Spending in different age groups (Apple App Store)",
  showlegend = T,
  grid = list(rows = 2, columns = 2),
  xaxis = list(
    showgrid = FALSE, zeroline = FALSE,
    showticklabels = FALSE, showlegend = TRUE
  ),
  yaxis = list(
    showgrid = FALSE, zeroline = FALSE,
    showticklabels = FALSE, showlegend = TRUE
  ),
  uniformtext = list(minsize = 12, mode = "hide")
)

age_rating_google <- google_cleaned %>%
  group_by(new_content, Category) %>%
  summarise(amount_spent = sum(price, na.rm = TRUE))

google_rating_4 <- age_rating_google %>% filter(new_content == 4)
google_rating_9 <- age_rating_google %>% filter(new_content == 9)
google_rating_12 <- age_rating_google %>% filter(new_content == 12)
google_rating_17 <- age_rating_google %>% filter(new_content == 17)

google_pie <- plot_ly()
google_pie <- google_pie %>%
  add_pie(
    data = google_rating_4, labels = ~Category,
    values = ~amount_spent, textposition = "inside", name = "4+",
    domain = list(row = 0, column = 0)
  ) %>%
  layout(annotations = a)
google_pie <- google_pie %>%
  add_pie(
    data = google_rating_9, labels = ~Category,
    values = ~amount_spent, textposition = "inside", name = "9+",
    domain = list(row = 0, column = 1)
  ) %>%
  layout(annotations = b)
google_pie <- google_pie %>%
  add_pie(
    data = google_rating_12, labels = ~Category,
    values = ~amount_spent, textposition = "inside", name = "12+",
    domain = list(row = 1, column = 0)
  ) %>%
  layout(annotations = c)
google_pie <- google_pie %>%
  add_pie(
    data = google_rating_17, labels = ~Category,
    values = ~amount_spent, textposition = "inside", name = "17+",
    domain = list(row = 1, column = 1)
  ) %>%
  layout(annotations = d)
google_pie <- google_pie %>% layout(
  title = "Spending in different age groups (Google Play Store)",
  showlegend = T,
  grid = list(rows = 2, columns = 2),
  xaxis = list(
    showgrid = FALSE, zeroline = FALSE,
    showticklabels = FALSE, showlegend = TRUE
  ),
  yaxis = list(
    showgrid = FALSE, zeroline = FALSE,
    showticklabels = FALSE, showlegend = TRUE
  ),
  uniformtext = list(minsize = 12, mode = "hide")
)
<<<<<<< HEAD

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
=======
>>>>>>> 571443f2a21aec18faf9f25ffe7b154120a6d8ec
