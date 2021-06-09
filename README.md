# Mineria de Datos

# Unit 3

###  Instituto Tecnologico de Tijuana
### Semestre Febrero-Junio 2021
###  Carrera: Ingenieria en sistemas Computacionales
###  Materia: Mineria de Datos
###  Maestro: Jose Christian Romero Hernandez
###   Oliver Cardenas Jesus Alejandro  16210561 
### Ojeda Sanchez Andrea Jhovanna



##  Index:
### Practice1
### Practice2
### Practice3
### Practice4
### Practice5
### Exam
### Video








## Practice 1
## Intructions

Make the analysis corresponding to the logistic regression R script, which must be documented in your repository, putting in this your visual results and your detailed description of your observations as well as the source of code.

```r
getwd()
setwd("/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/MachineLearning/LogisticRegression")
getwd()

# Importing the dataset
dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5]

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Feature scaling
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])

# Fitting Logistic Regression to Training set
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)

# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred

# Making the Confusion Metrix
cm = table(test_set[, 3], y_pred)
cm

# 
library(ggplot2)
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Install manually the library ElemStatLearn
install.packages(file.choose(), repos = NULL)

# Establish the set from the training set
set = training_set
# X1 and X2 will be come from the min and max of the first and second column of the set (trainig set)
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
# Create a grid set from X1 and X2
grid_set = expand.grid(X1, X2)
# Set the column names 
colnames(grid_set) = c('Age', 'EstimatedSalary')
# A new set of predictions
prob_set = predict(classifier, type = 'response', newdata = grid_set)
# Transform the values of the probability set to binary values
y_grid = ifelse(prob_set > 0.5, 1, 0)
##Plot the data based on age and estimated salary
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
# Create a contour to separate the probabilities
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
# Color the background based on the contour
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
# Color the points based on the binary values
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Do the same to Test set and compare results
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

## Practice 2
## Intructions
Do the analysis corresponding to the R script of K-Nearest Neighbors (K-NN) on
which should be documented in your repository by putting your results in it
visuals and your detailed description of your observations as well as the source of
code.


```r
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
```


## Practice 3
## Intructions
Make the analysis corresponding to the R script of the Decision Tree, which must be documented in its repository, putting in it its visual results and its detailed description of its observations as well as the source code.

```r
# Decision Tree Classification

getwd()
setwd("/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/MachineLearning/DesicionThree")
getwd()
# Importing the dataset
dataset = read.csv(file.choose())
# Cleaning the data
dataset = dataset[3:5]

# Transforming the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set with caTools
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling for both set's
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting Decision Tree Classification to the Training set with rpart
library(rpart)
classifier = rpart(formula = Purchased ~ .,
                   data = training_set)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3], type = 'class')
y_pred

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm

# Visualising the Training set results
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3],
     main = 'Decision Tree Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3], main = 'Decision Tree Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Plotting the tree
plot(classifier)
text(classifier, cex=0.6)
```



## Practice 4
## Intructions
Make the analysis corresponding to the R script of Random Forest which must be documented in its repository, putting in it its visual results and its detailed description of its observations as well as the source code.

```r
# Random Forest Classification

getwd()
setwd("C:/Users/navid/OneDrive/Documentos/DataMining/MachineLearning/RandomForest")
getwd()

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
# pin up a start seed
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting Random Forest Classification to the Training set
 #install.packages('randomForest')
#use library Random forest
library(randomForest)
# pin up a start seed
set.seed(123)
classifier = randomForest(x = training_set[-3],
                          y = training_set$Purchased,
                          ntree = 500, random_state = 0)


# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])
y_pred

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
#Visualize Confusion Matrix
cm

# Visualising the Training set results
#Use library elementstat
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
y_grid = predict(classifier, grid_set)
plot(set[, -3],
     main = 'Random Forest Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
##define colors of points of the graffic
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
library(ElemStatLearn)
# Establish the set from the Test set
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3], main = 'Random Forest Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Choosing the number of trees
plot(classifier)
```

## Practice 5
## Intructions
Make the analysis corresponding to the R script of the SVM, which must be documented in its repository, putting in it its visual results and its detailed description of its observations as well as the source code.

```r
# Support Vector Machine (SVM)
# Set our workspace
getwd()
setwd("C:/Users/navid/OneDrive/Documentos/DataMining/MachineLearning/SVM")
getwd()

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
#Use library Catools
library(caTools)
# pin up a start seed
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting SVM to the Training set
# install.packages('e1071')
# Use library e1071
library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
svm
# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm
# Visualising the Training set results
#Use  Library ElemStatLearn
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
y_grid = predict(classifier, newdata = grid_set)
# create the plot
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
##define colors of points of the graffic
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

## Exam
## Intructions

Develop the following problem with R and RStudio for knowledge extraction
that the problem requires.
Implement the Naive Bayes classification model with the dataset
Social_Network_Ads.csv and using the e1071 library with the naiveBayes () function.
Once the classifier is obtained, do the data visualization analysis
correspondent.
At the end of the development, explain in detail what the model of
Naive Bayes classification and also the detailed explanation corresponding to
data visualization.
Evaluation instructions
- Delivery time 3 days
- At the end put the code and the explanation in the corresponding branch of your
github also make your explanation of the solution in your google drive.
- Finally defend its development in a video of 8-10 min which will serve to give
your rating, this video must be uploaded to youtube to be shared by a link
public.

```r
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
```
## Video
https://www.youtube.com/watch?v=RftytNybKE0
