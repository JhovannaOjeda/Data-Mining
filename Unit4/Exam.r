#Get the data set
dataset = read.csv(file.choose())
dataset = dataset[1:4]
#Use the Elbon Metod to look the best number of clusters to use
set.seed(6)
Info = vector()
for (i in 1:10) Info[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10, Info, type = 'b', main = paste('The Elbow Method'), xlab = 'Number of clusters', ylab = 'Info')

# Fitting K-Means to the dataset
set.seed(29)
kmeans = kmeans(x = dataset, centers = 3)
y_kmeans = kmeans$cluster

# Visualising the clusters
#install.packages('cluster')
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of iris'),
         xlab = 'petal_lenght',
         ylab = 'peta_width')
