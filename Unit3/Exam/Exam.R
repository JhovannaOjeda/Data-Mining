# Instaling the necesary libraries
install.packages('e1071')
install.packages('lattice')
library(e1071)
library(caTools)
library(caret)
library(ElemStatLearn)

# Reading the csv ~ Social Network Adds
data <- read.csv(file.choose())
data <- data[3:5]
View(data)

# Starting with the naive bayes requirements
# Seting seed 123
set.seed(123)

# Creating the partition for training and test set
split <- sample(2, nrow(data), replace = TRUE, prob = c(0.7, 0.3))
training_set <- data[split == 1,]
test_set <- data[split == 2,]

# Scaling the features
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Starting the trainig with naive bayes
mod <- naiveBayes(Purchased ~ ., data = training_set, useKernel = TRUE)
mod

# Prediction
prediction <- predict(mod, test_set)
prediction

# Confusion Matrix
conMat <- table(test_set$Purchased, prediction, dnn = c("Original", "Prediccion"))
conMat
confusionMatrix(conMat)

# Ploting results
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(mod, grid_set)
plot(set[, -3],
     main = 'Naive Bayes Predictor',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(mod, grid_set)
plot(set[, -3],
     main = 'Naive Bayes Predictor',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
