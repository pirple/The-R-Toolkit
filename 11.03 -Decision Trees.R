## Decision Trees
#building the classification tree
#Example 1... Using Iris
library(tree)
library(caret)
library(rpart.plot)
library(RColorBrewer)

tree1 <- tree(Species ~ Sepal.Width + Petal.Width, data = iris)
summary(tree1)

plot(tree1)
text(tree1)

# example 2... car data
data_url <- c("https://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data")
download.file(url = data_url, destfile = "car.data")
car_df <- read.csv("car.data", sep = ',', header = FALSE)
# names(car_df) <- c("buying", "maintenance", "doors", "persons",
#                     "lug_boot", "safety", "Evaluation")

set.seed(1033)
intrain <- createDataPartition(y = car_df$V7, p= 0.7, list = FALSE)
training <- car_df[intrain,]
testing <- car_df[-intrain,]

tree2 <- rpart(V7 ~ V1 + V2 + V3 + V4 + V5 + V6, 
                data = training, method = "class")

rpart.plot(x = tree2, cex = 1, type = 0)



trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(1033)
dtree_fit <- train(V7 ~., data = training, method = "rpart",
                   parms = list(split = "information"),
                   trControl = trctrl,
                   tuneLength = 10)


test_pred <- predict(dtree_fit, newdata = testing)
confusionMatrix(test_pred, testing$V7)


