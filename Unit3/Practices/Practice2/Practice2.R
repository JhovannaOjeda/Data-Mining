# K-Nearest Neighbors (K-NN)
##word space
getwd()
setwd("C:/Users/navid/OneDrive/Documentos/DataMining/MachineLearning/KNN")
getwd()
# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')


dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# Library catools because we going to need it
library(caTools)
# pin up a start seed
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
#scale training set
training_set[-3] = scale(training_set[-3])
#scale test set
test_set[-3] = scale(test_set[-3])

# Fitting K-NN to the Training set and Predicting the Test set results
# library class
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
# Visualize the confusing matrix
cm
# Visualising the Training set results
# Install manually the library ElemStatLearn
## Necesary instalacion of this library
install.packages(file.choose(), repos = NULL)
# Library ElemStatLearn
library(ElemStatLearn)
# Establish the set from the training set
set = training_set
# X1  will be come from the min and max of the first  column of the set (trainig set)
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
# X2  will be come from the min and max of the second  column of the set (trainig set)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
# Create a grid set from X1 and X2
grid_set = expand.grid(X1, X2)
## Column names
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
# create the plot
plot(set[, -3],
     main = 'K-NN (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
##define colors of points of the graffic
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
## estadistica elemental

# Establish the set from the test set
set = test_set
# X1  will be come from the min and max of the first  column of the set (trainig set)
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
# X2  will be come from the min and max of the second  column of the set (trainig set)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
# Create a grid set from X1 and X2
grid_set = expand.grid(X1, X2)
## Column names
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
#create the plot
plot(set[, -3],
     main = 'K-NN (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
##define colors of points of the graffic
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
