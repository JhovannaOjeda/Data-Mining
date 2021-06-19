# Mineria de Datos

# Unit 4

###  Instituto Tecnologico de Tijuana
### Semestre Febrero-Junio 2021
###  Carrera: Ingenieria en sistemas Computacionales
###  Materia: Mineria de Datos
###  Maestro: Jose Christian Romero Hernandez
###   Oliver Cardenas Jesus Alejandro  16210561 
### Ojeda Sanchez Andrea Jhovanna



##  Index:
## Exam
## Video

### Instructions

Develop the following problem with R and RStudio for knowledge extraction
that the problem requires.
Implement the K-Means grouping model with the Iris.csv dataset that
found at https://github.com/jcromerohdz/iris using method
kmeans () in R. Once the grouping model is obtained, do the analysis
corresponding data display.
At the end of the development, explain in detail what the model of
K-Means grouping and what were your observations in the visualization analysis
of data.
Evaluation instructions
- Delivery time 3 days
- At the end put the code and the explanation in the corresponding branch of your
github also make your explanation of the solution in your google drive.
- Finally defend its development in a video of 8-10 min which will serve to give
your rating, this video must be uploaded to youtube to be shared by a link
public.

```r
dataset <- read.csv(file.choose())

dataset = dataset[1:4]
View(dataset)

# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

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


EXAM CONCLUSION
As we can see in the chart, 2 types of Irises are very similar between them; they have 
much flowers on both categories; whereas the third one its well defined and doesn’t share 
any of his members. Other things it’s than even if majority share the same width of the 
petal, there are differences in the length, so we can infer that the length it’s a characteristic
more particular of every group over the width. These groups depends on 4 characteristics 
even if the chart shows only 2.

```
### Video

https://www.youtube.com/watch?v=luYJiMgRHQ8
