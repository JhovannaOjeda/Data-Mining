#Geting the data set
ds = read.csv(file.choose())

#Using the Elbon Metod to look the best number of clusters to use
set.seed(6)
Info = vector()
for (i in 1:10) Info[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10, Info, type = 'b', main = paste('The Elbow Method'), xlab = 'Number of clusters', ylab = 'Info')
