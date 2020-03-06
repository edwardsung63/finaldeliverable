library(dplyr)

apple_initial <- read.csv("./data/AppleStore.csv", stringsAsFactors = FALSE)
apple_cleaned <- apple_initial %>%
  select(c(
    size_bytes, price,
    rating_count_tot, user_rating,
    cont_rating, prime_genre
  ))
apple_cleaned <- apple_cleaned %>%
  mutate(new_content_rating = as.numeric(gsub("[+]", "", cont_rating)))
apple_cleaned <- apple_cleaned %>%
  select(-c(cont_rating))
