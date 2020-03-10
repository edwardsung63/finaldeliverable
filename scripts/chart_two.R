library(dplyr)
library(tidyr)
library(ggplot2)
library(gapminder)
library(ggpubr)
library(plotly)

source("./scripts/sum_table.R")

fig3 <- ggplot(
  google_table, aes(x = avg_rating, y = overall_paid_price)) +
  geom_point()
plot_two_google <- plot_ly(
  google_table,
  x = ~avg_rating, y = ~overall_avg_price,
  # Hover text:
  text = ~ paste(
    "Category: ", Category,
    "<br>Average rating: ", avg_rating,
    "<br>Average price:", overall_avg_price,
    "<br>Total number of applications: ", count
  ),
  color = ~overall_avg_price, size = ~overall_avg_price
)
plot_two_google <- plot_two_google %>%
  layout(title = "Average rating vs Overall average price (Google Play Store)")

plot_two_apple <- plot_ly(
  apple_table,
  x = ~avg_rating, y = ~overall_avg_price,
  # Hover text:
  text = ~ paste(
    "Category: ", Category,
    "<br>Average rating: ", avg_rating,
    "<br>Average price:", overall_avg_price,
    "<br>Total number of applications: ", count
  ),
  color = ~overall_avg_price, size = ~overall_avg_price
)
plot_two_apple <- plot_two_apple %>%
  layout(title = "Average rating vs Overall average price (Apple App Store)")
