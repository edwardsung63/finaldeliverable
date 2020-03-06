library(dplyr)
library(tidyr)
library(ggplot2)
library(ggpubr)

source("./scripts/sum_table.R")

plot_one_google <- ggplot(
  data = google_table,
  aes(fill = count, x = Category, y = count)
) +
  ggtitle("Amount of applications per category (Google Play Store)") +
  ylab("Number of applications") +
  xlab("Category") +
  geom_bar(stat = "identity", width = 0.8) +
  theme(
    axis.text.x = element_text(
      size = 7, angle = 90,
      hjust = 1, vjust = 0.5
    ),
    plot.title = element_text(hjust = 0.5)
  ) +
  geom_text(aes(x = Category, y = count + 1000, label = count),
    size = 1.5
  )

plot_one_apple <- ggplot(
  data = apple_table,
  aes(fill = count, x = prime_genre, y = count)
) +
  ggtitle("Amount of applications per category (Apple App Store)") +
  ylab("Number of applications") +
  xlab("Category") +
  geom_bar(stat = "identity", width = 0.8) +
  theme(
    axis.text.x = element_text(
      size = 7, angle = 90,
      hjust = 1, vjust = 0.5
    ),
    plot.title = element_text(hjust = 0.5)
  ) +
  geom_text(aes(x = prime_genre, y = count + 100, label = count),
    size = 2
  )
