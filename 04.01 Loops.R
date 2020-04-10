## Loops
# While
i <- 1
while(i < 25){
  print(i)
  i <- i + 1
}

# for
for(i in 1:25){
  print(paste0("the number is ", i))
}

# nested for
mtx <- matrix(ncol = 30, nrow = 30)
for(r in 1:dim(mtx)[1]){
  for(c in 1:dim(mtx)[2]){
    mtx[r,c] <- r * c
  }
}


