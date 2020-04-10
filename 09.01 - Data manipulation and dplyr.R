## Data manipulation and dplyr
# dataset
library(nycflights13)

# select
select(flights, month, dest, day)
select(flights, arr_time:tailnum)
select(flights, -(arr_time:tailnum))

# filter
a <- flights[flights$year == 2013 & flights$month == 1,]
b <- filter(flights, year == 2013, month == 1)

# arrange
a <- flights[order(flights$carrier, flights$year),]
b <- arrange(flights, carrier, desc(year))

# mutate
a <- mutate(flights, tot.delay = arr_delay + dep_delay)

# summarise
a <- summarise(flights, mx = mean(dep_delay, na.rm = T))


#sample n
sample_n(flights, 10)

# Piping
a <- flights %>% 
  group_by(carrier) %>% 
  summarize(avg = mean(dep_delay, na.rm = T)) %>%
  arrange(desc(avg)) %>%
  filter(carrier != "F9")


