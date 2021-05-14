# Mineria de Datos

# Unit 2

###  Instituto Tecnologico de Tijuana
### Semestre Febrero-Junio 2021
###  Carrera: Ingenieria en sistemas Computacionales
###  Materia: Mineria de Datos
###  Maestro: Jose Christian Romero Hernandez
###   Oliver Cardenas Jesus Alejandro  16210561 
### Ojeda Sanchez Andrea Jhovanna



##  Index:
### Practice1
### Exam
### Video








## Practice 1
## Intructions

- Search for a data source in csv format (Free theme)
-  2. Read the csv and analyze the data with R
- 3. Generate three graphs with R that tells the story of the data, the first being a scatter plot of points,
- the second is a faceted graph and the third is a graph that tells us something statistical such as the distribution of the data and that contains the theme layer.
- This practice must be documented in its respective branch (branc) of your work repository

```r
#Movies Metadata
movies <- read.csv(file.choose())
View(movies)

#Delete the homepage column and imbd id
movies$homepage <- NULL
movies$imdb_id <- NULL
movies$popularity <- NULL
movies$poster_path <-NULL
movies$status <- NULL
movies$video <- NULL

#Rename the columns
colnames(movies) <- c("Adult", "Colection", "Budget", "Genres", "ID", "Original Languaje", 
                      "Original Title", "Resume", "Companies", "Production Countries", "Release date", 
                      "Revenue", "Duration", "Dubbed", "Slogan", "Title", "Vote.Average", "Vote.Count")
View(movies)

#Analize data
head(movies)
tail(movies)
str(movies)
summary(movies)

#Graphics: Scatter plot
library(ggplot2)
plot <- ggplot(data=movies, aes(x=Vote.Average, y=Vote.Count, color=Vote.Average))
plot + geom_point()

#With Facets
plot + geom_point() + facet_grid(Vote.Average~., scales="free")

#Theme
plot+ xlab("Average") + ylab("Count") + ggtitle("Votation per movie") + 
  geom_point() + theme(axis.title.x = element_text(color = "Black", size=17), 
                       axis.title.y = element_text(color = "Black", size=17), 
                       plot.title = element_text(color = "DarkBlue", size = 20, family = "Courier"))
```

## Exam
## Instrucions

```r
#Read csv
moviesData <- read.csv(file.choose())
lostgrafic<- read.csv(file.choose())
lostgrafic
View(moviesData)
##Rename columns csv 
colnames(moviesData) <- c("Day", "Director", "Genre", "Title", "Release Date", "Studio", "Adjusted_GrossM", "Budget_M", "GrossM", "ImDb_Rating", "Movie_Lens_Rating", "OverseasM", "Overseas", "ProfitM", "Profit", "Runtime(min)", "USM", "Gross_US")
colnames(lostgrafic) <- c( "dayofweek","Director", "Genre", "MovieTitle", "ReleaseDate","Studio","adjustedGrossmillions" ,"Budgetmillions","Grossmillions" ,"IMDBRating"," MovieLens","overseasmillions","overseas","profitmillions","profit","runtimemillions","usmillions","GrossUS")
##First elements csv
head(moviesData)
##Last elements csv
tail(moviesData)

act <- moviesData[moviesData$Genre == "action",]
adv <- moviesData[moviesData$Genre == "adventure",]
ani <- moviesData[moviesData$Genre == "animation",]
com <- moviesData[moviesData$Genre == "comedy",]
dra <- moviesData[moviesData$Genre == "drama",]
##Matrix
moviesData2 <- rbind(act, adv, ani, com, dra)
View(moviesData2)

bue <- moviesData2[moviesData2$Studio == "Buena Vista Studios",]
fox <- moviesData2[moviesData2$Studio == "Fox",]
par <- moviesData2[moviesData2$Studio == "Paramount Pictures",]
sony <- moviesData2[moviesData2$Studio == "Sony",]
uni <- moviesData2[moviesData2$Studio == "Universal",]
wb <- moviesData2[moviesData2$Studio == "WB",]
##Matrix
moviesData3 <- rbind(bue, fox, par, sony, uni, wb)
View(moviesData3)
##Library ggplot
library(ggplot2)
## create plot
moviesPlot <- ggplot(data=moviesData3, aes(x=Genre, y=Gross_US))

moviesPlot + geom_jitter(aes(color=Studio, size=Budget_M)) + 
  geom_boxplot(alpha=.7) + xlab("Genre") + ylab("Gross % US") + 
  ggtitle("Domestic Gross % by Genre") + theme (
    axis.title = element_text(color = "Purple", size=15, family = "sans"),
    axis.text = element_text(family = "sans"),
    plot.title = element_text(hjust = .5, size = 20, family = "sans")
  ) 
```

## Conclusion

The result can be seen in the following graphic in which we can see in our boxplot plot and you can see the number of films of the genres action, adventure, animation, comedy, drama and Buena vista studios, Fox, Paramount Pictures, Sony,Universal. We can see how jitter representation presents the participation of each study with respect to each gender and the investment of participation.
For each genre we also have a boxplot to represent the average, minimum and maximum of data compared to its gross product in the United States, basically from this graph we can rescue that the genre with the most productions and general investment its action, on the contrary, the drama one does not have many productions.
The genre with the lowest generated gross product was animation, while drama got the largest gross product, although from what we noticed in the end, the action is what sells the most and the most productions it has in the period when the data was recopilated.


![image](https://user-images.githubusercontent.com/63790039/118206467-6c59bd00-b417-11eb-966c-e288cc84bf13.png)



### Video
https://www.youtube.com/watch?v=pz7ThWvWyJg
