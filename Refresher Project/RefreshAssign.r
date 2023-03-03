library(tidyverse)
view(diamonds)
diamonddata <- diamonds
inventory <- read_csv("InventoryData.csv", 
                      col_types = cols(`Item SKU` = col_number()))
answer_1 <- nrow(diamonds)
answer_2 <- ncol(diamonds)
ggplot(data = diamonds, aes(x=carat, y=price)) + geom_point()
ggplot(data = diamonds, aes(x=carat, y=price, color=cut)) + geom_point()
ggplot(data = diamonds, aes(x=cut, y=price)) + geom_point() + facet_grid(.~color)
typeof(inventory$Supplier)
# 6 = Character
on_hand_mean <- mean(inventory$`On Hand`)
inventoryA <- inventory %>% filter(Supplier == 'A')
inventoryA = mutate(inventoryA, OnHandRatio = inventoryA$'On Hand'/inventoryA$'Annual Demand')
# Answer is B For Question 9

avg_cost <- inventoryA %>% 
  summarize(SKUAvgCost=mean(inventoryA$`Cost per Unit ($)`)) %>%
  group_by(inventoryA$`Item SKU`)
  