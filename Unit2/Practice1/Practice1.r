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