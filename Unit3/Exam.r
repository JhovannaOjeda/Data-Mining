# Instaling the necesary libraries
install.packages('e1071')
install.packages('lattice')
library(e1071)
library(caTools)
library(caret)

# Reading the csv ~ Social Network Adds
data <- read.csv(file.choose())
data <- data[3:5]
View(data)

# Starting with the naive bayes requirements
# Seting seed 123
set.seed(123)

# Creatin the partition for training and test set
split <- sample.split(data$Purchased, SplitRatio = 0.70)
training_set <- subset(data, split == TRUE)
test_set <- subset(data, split == FALSE)

# Starting the trainig with naive bayes
mod <- naiveBayes(Purchased ~ ., data = training_set[-3]) 
mod

# Prediction
prediction <- predict(mod, test_set)

# Confusion Matrix
conMat <- table(test_set$Purchased, prediction, dnn = c("Original", "Prediccion"))
conMat
confusionMatrix(conMat)

