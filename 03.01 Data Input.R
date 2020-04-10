## What is data input and output?

## importing
setwd("C:/R_Training/02_Input_Output")
library(xlsx)
# csv
ds <- read.csv(file = "nhl_2017-10-14.csv")

# xlsx
ds2 <- read.xlsx("PlayersChampionshipData.xlsx", sheetIndex = 1, header = T, startRow = 2)

# RData
load("hitters.RData")


# text (tab delimited)
ds3 <- read.csv(file = "NFL_2017_Week_14_CHI.txt", sep = "\t")


# scraping web data
library(rvest)
library(dplyr)
url <- "https://www.hockey-reference.com/teams/index.html"
nhl.ref <- read_html(url)
  nhl.ds <- nhl.ref %>%
  html_nodes(xpath='//*[@id="active_franchises"]') %>%
  html_table(fill = TRUE)
nhl.teams <- nhl.ds[[1]]

# sourcing R code
source("stocks_functions.R")



