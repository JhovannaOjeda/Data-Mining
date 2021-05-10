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
tail(lostgrafic)

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
