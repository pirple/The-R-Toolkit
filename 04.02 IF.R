# IF Statements
iris$new.col <- NA
for(i in 1:nrow(iris)){
  if(iris$Sepal.Length[i] > 6){
    iris$new.col[i] <- "long"
    } else {
    iris$new.col[i] <- "short"
    }
}


# ifelse
a <- ifelse(20 > 15, "true", "false")


# Challenge
# find a fun dataset
# Two example for each of:
# While, for, if
# data.gov

