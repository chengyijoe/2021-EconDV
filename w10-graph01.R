###########################################
#  01  平日較多夜間停留人數的區域           #
###########################################

library(readr)
library(tidyverse)

demo <- read.csv("2020Nov_district.csv")

subset1 <- demo %>%
  filter(NIGHT_WORK >= NIGHT_WEEKEND) %>%
  group_by(COUNTY) %>%
  subset(select = c(COUNTY, TOWN))

subset1$COUNTY <- as.factor(subset1$COUNTY)

plot1 <- ggplot(
  data = subset1,
  aes( y = COUNTY))+
  geom_bar( fill = "cyan3",
            width = 0.5,
            position = position_dodge(0.4))+
  geom_text(stat = "count",
            aes(label = (..count..)),
            vjust = -0.1, #input$vjust
            hjust = 0.1, #input$hjust
            size = 4)+ #input$size
  labs(title = "2020年11月各縣市平日夜間停留人數較多的區域數量")

plot1
