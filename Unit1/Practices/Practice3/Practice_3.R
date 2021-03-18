#Declaring the csv
rcsv <- read.csv("C:\\Users\\Jhovanna Ojeda\\Documents\\Escuela\\DataMining\\Unit_1\\P3.csv", TRUE, ",")

#profit for each mounth
profit <- rcsv$Mounthly.Revenue - rcsv$Expenses


#good months - where the profit after tax was greater than the mean for the year
goodMonths <- rcsv[profitAfter > mean(rcsv$Mounthly.Revenue)]


#the worst month - where the profit after tax was min for the year
min(profitAfter)