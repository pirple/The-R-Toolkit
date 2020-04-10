## GREAT R PACKAGES
# data manipulation
library(dplyr)
ds <- ds %>% filter(col1 == "blue") %>%
  group_by(col2) %>% summarize(x = n())

# visualizations
library(ggplot2)
ggplot(ds, aes(x = dt, y = tot)) + geom_line() +
  facet_grid(State ~ color)

# working with dates
library(lubridate)
mdy("6/23/2018")

# working with strings
library(stringr)

# reshaping data
library(reshape2)
# melt, #dcast

# Web scraping
library(rvest)


# Developing packages
library(devtools)

# Database connection
library(RODBC)

# working with Excel 
library(readxl)


