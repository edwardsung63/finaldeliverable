library(dplyr)
library(stringr)

google_initial <- read.csv("./data/Google-Playstore-Full.csv",
  stringsAsFactors = FALSE
)
google_cleaned <- google_initial %>%
  select(c(Category, Rating, Reviews, Installs, Size, Price, Content.Rating))
google_cleaned <- google_cleaned %>%
  filter(!is.na(as.numeric(Rating)))
google_cleaned <- google_cleaned %>%
  filter(!is.na(Rating))
google_cleaned <- google_cleaned %>%
  filter(!is.na(as.numeric(Reviews)))
google_cleaned <- google_cleaned %>%
  filter(!is.na(Reviews))
google_cleaned <- google_cleaned %>%
  mutate(
    price = as.numeric(gsub("[$]", "", Price)),
    installs = as.numeric(gsub("[+]", "", str_replace_all
    (Installs, "[[:punct:]]", "")))
  )
google_cleaned <- google_cleaned %>%
  select(-c(Price, Installs))
google_cleaned <- google_cleaned %>%
  filter(Size != "Varies with device")
google_cleaned <- google_cleaned %>%
  filter(Category != "TRAVEL")
google_cleaned <- google_cleaned %>%
  filter(Content.Rating != "Unrated")
google_cleaned <- google_cleaned %>%
  mutate(new_content = ifelse(Content.Rating == "Everyone", 4,
    ifelse(Content.Rating == "Everyone 10+", 9,
      ifelse(Content.Rating == "Teen", 12,
        ifelse(Content.Rating == "Mature 17+" |
          Content.Rating == "Adults only 18+", 17, 0)
      )
    )
  ))
