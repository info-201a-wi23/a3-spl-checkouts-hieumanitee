library(ggplot2)
library(dplyr)
data <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)
data_2022 <- data %>% filter(CheckoutYear == "2022")


book_checkouts <- data_2022 %>%
  filter(MaterialType == "BOOK") %>%
  group_by(CheckoutMonth) %>%
  summarise(total_checkouts = sum(Checkouts))

ebook_checkouts <- data_2022 %>%
  filter(MaterialType == "EBOOK") %>%
  group_by(CheckoutMonth) %>%
  summarise(total_checkouts = sum(Checkouts))

chart1 <- ggplot(data_2022) +
  geom_line(data = book_checkouts, aes(x = CheckoutMonth, y = total_checkouts, color = "Books")) +
  geom_line(data = ebook_checkouts, aes(x = CheckoutMonth, y = total_checkouts, color = "Ebooks")) +
  labs(title = "Total Ebooks VS Total Books Per Month", x = "Month", y = "Total Checkouts", color = "Format") +
  scale_color_manual(values = c("blue", "red")) +
  scale_x_continuous(breaks = seq(1, 12))

