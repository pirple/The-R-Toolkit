## Intro to Machine Learning
# Algorithm:
#       a set of guidelines that describe how to perform a task

# regression
# Create Training and Test data
library(ggplot2)
set.seed(1033)
tr <- sample(1:nrow(cars), 0.8 * nrow(cars))
train <- cars[tr, ]
test <- cars[-tr,]

# Build the model on training data
lmMod <- lm(dist ~ speed, data = train)

# predict
distPred <- predict(lmMod, test)

#results
summary(lmMod)
AIC(lmMod)
actual_preds <- data.frame(actuals = test$dist, predicted = distPred)
mape <- mean(abs(actual_preds$predicted - actual_preds$actuals) / actual_preds$actuals)

#plot it
ggplot(cars, aes(x = dist, y = speed)) + geom_point() +
  stat_smooth(method = "lm", col = "red")




