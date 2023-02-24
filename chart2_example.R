library(ggplot2)
library(dplyr)

data_2022 <- data %>% filter(CheckoutYear == "2022")


sounddisc_checkouts <- data_2022 %>%
  filter(MaterialType == "SOUNDDISC") %>%
  group_by(CheckoutMonth) %>%
  summarise(total_checkouts = sum(Checkouts))

audiobook_checkouts <- data_2022 %>%
  filter(MaterialType == "AUDIOBOOK") %>%
  group_by(CheckoutMonth) %>%
  summarise(total_checkouts = sum(Checkouts))

chart2 <- ggplot(data_2022) +
  geom_line(data = audiobook_checkouts, aes(x = CheckoutMonth, y = total_checkouts, color = "Audiobooks")) +
  geom_line(data = sounddisc_checkouts, aes(x = CheckoutMonth, y = total_checkouts, color = "Sounddiscs")) +
  labs(title = "Total Sounddiscs VS Total Audiobooks Per Month", x = "Month", y = "Total Checkouts", color = "Format") +
  scale_color_manual(values = c("blue", "red")) +
  scale_x_continuous(breaks = seq(1, 12))
