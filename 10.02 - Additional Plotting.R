library(ggplot2)
library(dplyr)

## ggplot - Additional plotting
# example: line chart
ds2 <- ds %>% group_by(Salary) %>% summarise(avg = mean(DK.PTS))
ggplot(ds2, aes(x = Salary, y = avg)) + geom_line(stat = "identity")

# example: box plot
ggplot(ds, aes(x = pos, y = DK.PTS)) + geom_boxplot()

# Color from a variable
ds3 <- ds %>% group_by(team, pos) %>% summarise(avg = mean(DK.PTS))
ggplot(ds3, aes(x = team, y = avg, fill = pos)) + geom_bar(stat = "identity") +
    scale_fill_brewer(palette = "Blues")

# Adding in vertical lines
ggplot(ds2, aes(x = Salary, y = avg)) + geom_line(stat = "identity") +
    geom_vline(aes(xintercept = 5000, color = "red"))

# add/remove the legend
ggplot(ds3, aes(x = team, y = avg, fill = pos)) + geom_bar(stat = "identity") +
  scale_fill_brewer(palette = "Blues") + theme(legend.position = "none")

# adjust x labels
ggplot(ds3, aes(x = team, y = avg, fill = pos)) + geom_bar(stat = "identity") +
  scale_fill_brewer(palette = "Blues") +
  theme(axis.text.x = element_text(face = "bold", color = "red", size = 14, angle=45))
