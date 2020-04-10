## lists and lapply
# LISTS
a <- 1:100
b <- c("a", "b", "c")
c <- 200:300
d <- list(a,b,c)

# sample data
View(stocks)

# Custom function
getPrices <- function(ticker){
  print(ticker)
  temp <- stocks[stocks$ticker == ticker,]
  mn <- min(temp$Close.ticker, na.rm = T)
  mx <- max(temp$Close.ticker, na.rm = T)
  avg <- mean(temp$Close.ticker, na.rm = T)
  out <- data.frame(ticker = ticker, min = mn, max = mx, avg = avg)
  return(out)
}


# Bring it all together
lst <- as.list(unique(stocks$ticker))

results <- lapply(X = lst, FUN = getPrices)
results2 <- do.call(rbind, results)
