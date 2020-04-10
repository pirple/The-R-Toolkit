library(ggplot2)
library(dplyr)

## ggplot - Advanced plotting
# text labels
ds2 <- filter(ds, pos == "DEF")
ggplot(ds2, aes(x = Salary, y = DK.PTS, label = dk.name)) + geom_text()

# facet wrap
ds3 <- filter(ds, Salary >= 5000, Salary <= 6000)
ggplot(ds3, aes(x = Salary, y = DK.PTS, label = dk.name)) + geom_text() +
  facet_wrap(~ pos, scales = "free")

# facet grid
ds4 <- filter(ds, team %in% c('GB', 'NE', 'DEN', 'BAL'))
ggplot(ds4, aes(x = Salary, y = DK.PTS, label = dk.name)) + geom_text() +
  facet_grid(team ~ pos, scales = "free")
