library(dplyr)

source("scripts/google_cleaned.R")

get_summary_info_google <- function(dataset) {
  summary_google <- google_cleaned %>%
    group_by(Category) %>%
    summarise(
      count = length(Category),
      money_made = sum(price, na.rm = TRUE)
    ) %>%
    arrange(desc(count))
  ret_category <- as.character(summary_google[1, 1])
  ret_count <- summary_google[1, 2]
  ret_money_made <- summary_google[1, 3]
  ret_unique_categories <- length(unique(google_cleaned[, 1]))
  ret_least_cat <- as.character(summary_google[49, 1])
  ret_least_count <- summary_google[49, 2]
  ret_least_money <- summary_google[49, 3]
  ret <- list(
    ret_category, ret_count, ret_money_made,
    ret_unique_categories, ret_least_cat, ret_least_count, ret_least_money
  )
  return(ret)

  return(ret)
}
google_list <- get_summary_info_google(google_cleaned)
