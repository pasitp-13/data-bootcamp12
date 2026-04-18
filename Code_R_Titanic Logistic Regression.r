install.packages("titanic")
library(titanic)

head(titanic_train)

## DROP NA (missing value)
titanic_train <- na.omit(titanic_train)
nrow(titanic_train)

## SPLIT DATA
set.seed(99)

n <- nrow(titanic_train)
id <- sample(1:n, size = n * 0.7) # 70% train 30% test
train_data <- titanic_train[id, ]
test_data <- titanic_train[-id, ]

train_model <- glm(Survived ~ Pclass + Age, data = train_data, family = "binomial")
summary(train_model)

## PREDICTION
test_model <- predict(train_model, newdata = test_data, type = "response")
pred_test <- ifelse(test_model >= 0.5, 1, 0)

## CONFUSION MATRIX
confMtx <- table(pred_test, test_data$Survived, dnn = c("Predicted", "Actual"))

## Accuracy -> (True Positive + True Negative) / Total
(accuracy <- (confMtx[1, 1] + confMtx[2, 2]) / sum(confMtx))

## Precision -> True Positive / (True Positive + False Positive)
(precision <- confMtx[2, 2] / (confMtx[2, 2] + confMtx[2, 1]))

## Recall -> True Positive / (False Negative + True Positive)
(recall <- confMtx[2, 2] / (confMtx[1, 2] + confMtx[2, 2]))

## F1 Score -> 2 * ((Precision * Recall) / (Precision + Recall))
(f1 <- 2 * ((precision * recall) / (precision + recall)))
