library(dplyr)
library(tidyverse)

data <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

total_materialtype_checkouts <- data %>%
  group_by(MaterialType) %>%
  summarize(total_checkouts = sum(Checkouts))

data %>%
  filter(MaterialType == "EBOOK") %>%
  summarise(avg_checkouts = mean(Checkouts))


data %>%
  filter(MaterialType == "BOOK") %>%
  summarise(avg_checkouts = mean(Checkouts))
