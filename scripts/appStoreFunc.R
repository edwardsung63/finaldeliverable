library(dplyr)

source("scripts/app_cleaned.R")

get_summary_info_apple <- function(apple_cleaned) {
  summary_apple <- apple_cleaned %>%
    group_by(prime_genre) %>%
    summarise(
      count = length(prime_genre),
      money_made = sum(price, na.rm = TRUE)
    ) %>%
    arrange(desc(count))
  ret_category <- as.character(summary_apple[1, 1])
  ret_count <- summary_apple[1, 2]
  ret_money_made <- summary_apple[1, 3]
  ret_unique_categories <- length(unique(apple_cleaned[, 4]))
  ret_least_cat <- as.character(summary_apple[23, 1])
  ret_least_count <- summary_apple[23, 2]
  ret_least_money <- summary_apple[23, 3]
  ret <- list(
    ret_category, ret_count, ret_money_made,
    ret_unique_categories, ret_least_cat, ret_least_count, ret_least_money
  )
  return(ret)
}
apple_list <- get_summary_info_apple(apple_cleaned)
