data <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)
library(dplyr)
library(tidyverse)
library(ggplot2)


data_2022 <- data %>% filter(CheckoutYear == "2022")

format_colors <- c("BOOK" = "orange", "EBOOK" = "lightblue", "AUDIOBOOK" = "red", "SOUNDDISC" = "blue")


books_by_format <- data_2022 %>%
  filter(MaterialType %in% c("BOOK", "EBOOK", "AUDIOBOOK", "SOUNDDISC", "")) %>%
  group_by(MaterialType) %>%
  summarise(total_checkouts = sum(Checkouts))


chart3 <- ggplot(books_by_format, aes(x = MaterialType, y = total_checkouts, fill = MaterialType)) +
  geom_col() +
  scale_fill_manual(values = format_colors) +
  labs(title = "Total Checkouts for each Material Type", x = "Format", y = "Total Checkouts") +
  theme_bw()
