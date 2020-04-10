##K-means clustering
library(zipcode)
library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(geosphere)
options(scipen = F)
set.seed(1033)
ds <- read.csv(file = "https://data.ny.gov/api/views/9a8c-vfzj/rows.csv?accessType=DOWNLOAD")

# bring in zip code data to get lat long info
data(zipcode)
zipcode$city2 <- toupper(zipcode$city)
ds$zip2 <- clean.zipcodes(ds$Zip.Code)
ds <- merge(ds, zipcode, by.x = "zip2", by.y = "zip", all.x = T)


# cluster analysis
data.cl <- ds %>% select(x = longitude, y = latitude)
data.cl <- data.cl[!is.na(data.cl$x) & !is.na(data.cl$y),]

# baseline plot
ggplot(data.cl, aes(x = x, y = y)) + geom_point(data = data.cl, stat = "identity", show.legend = F) + 
  theme_bw() + xlab("longitude") + ylab("latitude") + ggtitle("Distribution Network - BASELINE")


# kmeans - TWO
store.cl <- kmeans(data.cl, 2)
data.cl$clust <- store.cl$cluster
centers <- data.frame(store.cl$centers)
centers$clust <- 1:nrow(centers)
miles <- merge(data.cl, centers, by.x = "clust", by.y = "clust")
mls <- c()
for(i in 1:nrow(miles)){
  mls.temp <- round(as.numeric(distm(c(miles$x.x[i], miles$y.x[i]), c(miles$x.y[i], miles$y.y[i]), fun = distHaversine) * 0.000621371),0)
  mls <- c(mls, mls.temp)
}
miles$miles <- mls
mx.dist2 <- max(miles$miles)
tot.mls2 <- sum(miles$miles, na.rm = T)



# kmeans - THREE
store.cl <- kmeans(data.cl, 3)
data.cl$clust <- store.cl$cluster
centers <- data.frame(store.cl$centers)
centers$clust <- 1:nrow(centers)
miles <- merge(data.cl, centers, by.x = "clust", by.y = "clust")
mls <- c()
for(i in 1:nrow(miles)){
  mls.temp <- round(as.numeric(distm(c(miles$x.x[i], miles$y.x[i]), c(miles$x.y[i], miles$y.y[i]), fun = distHaversine) * 0.000621371),0)
  mls <- c(mls, mls.temp)
}
miles$miles <- mls
mx.dist3 <- max(miles$miles)
tot.mls3 <- sum(miles$miles, na.rm = T)



# plot it
ggplot(data.cl, aes(x = x, y = y, colour = as.character(clust))) + geom_point(data = data.cl, stat = "identity", show.legend = F) +
  geom_point(data = centers, shape = 23, fill = "darkred", color="darkred", size = 5) + theme_bw() +
  xlab("longitude") + ylab("latitude") + ggtitle("Distribution Network - 5 Points") +
  scale_color_brewer(palette = "Set1") 


