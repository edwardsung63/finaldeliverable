library(dplyr)
library(stringr)
library(lintr)
library(styler)
source("./scripts/app_cleaned.R")
source("./scripts/google_cleaned.R")

get_summary_table_google <- function(google_cleaned) {
  google_cleaned <- google_cleaned %>% filter(!is.na(as.numeric(Rating)))
  google_cleaned <- google_cleaned %>% filter(!is.na(Rating))
  google_cleaned <- google_cleaned %>% filter(!is.na(as.numeric(Reviews)))
  google_cleaned <- google_cleaned %>% filter(!is.na(Reviews))
  ret_table <- google_cleaned %>%
    group_by(Category) %>%
    summarise(
      avg_rating = round(mean(as.numeric(Rating), na.rm = TRUE), digits = 2),
      overall_avg_price = round(mean(as.numeric(gsub("[$]", "", price)),
        na.rm = TRUE
      ),
      digits = 2
      ),
      paid_avg_price = round(mean(replace(price, price == 0, NA),
        na.rm = TRUE
      ), digits = 2),
      count = length(Category)
    ) %>%
    arrange(desc(count))
  return(ret_table)
}

google_table <- get_summary_table_google(google_cleaned)

get_summary_table_apple <- function(apple_df) {
  ret_table <- apple_df %>%
    group_by(prime_genre) %>%
    summarise(
      avg_rating = round(mean(as.numeric(user_rating), na.rm = TRUE),
        digits = 2
      ),
      overall_avg_price = round(mean(price, na.rm = TRUE), digits = 2),
      paid_avg_price = round(mean(replace(price, price == 0, NA),
        na.rm = TRUE
      ), digits = 2),
      count = length(prime_genre)
    ) %>%
    arrange(desc(count))
  return(ret_table)
}
apple_table <- get_summary_table_apple(apple_cleaned)
