# Mineria de Datos

# Unit 1

###  Instituto Tecnologico de Tijuana
### Semestre Febrero-Junio 2021
###  Carrera: Ingenieria en sistemas Computacionales
###  Materia: Mineria de Datos
###  Maestro: Jose Christian Romero Hernandez
###   Oliver Cardenas Jesus Alejandro  16210561 
### Ojeda Sanchez Andrea Jhovanna



###  Index:
#### Practice1
#### Practice2
#### Practice3
#### Practice4
#### Practice5

### Practice 1
###Intructions
Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1:

Create an R script that will count how many of these numbers fall between -1 and 1 and divide
by the total quantity of N

You know that E(X) = 68.2%
Check that Mean(Xn)->E(X) as you rerun your script while increasing N

Hint:
1. Initialize sample size
2. Initialize counter
3. loop for(i in rnorm(size))
4. Check if the iterated variable falls
5. Increase counter if the condition is true
6. return a result <- counter / N

```r
#Declaring the N variable with a random normal distribution of numbers an our 
##counter
N <- rnorm(10000)
c <- 0

#Iteration to check the law of large numbers
  for(i in length(N)){
    if(N[i] <= 1){
      if(N[i] >= -1){
        c <- c + 1 
      }
    }
  }

#Final Step: mean
  r <- c/length(N)
  
  #Print it
  r
```

### Practice 2

### Intructions
Functions

Practice find 20 more functions in R and make an example of it.

```r
# 1 Remove decimals from a number
trunc (1.999999)

# 2 Show the numbers of elements in a vector
x <- 1:30
length (x)

# 3 The decimal numbers indicated in this case are rounded 1
round (6.78,1)

# 4 Generate n random numbers between the indicated numbers
runif (5,1,10)

# 5 Rounding to the upper whole number
ceiling (9.1)

# 6 Rounding to the lower whole number
floor (9.1)

# 7 Sum of the values

sum (1, 2, 3, 4, 5)

# 8 Exponential function
exp (3)

# 9 absolute value
abs (4)

# 10 Minimum and maximum values ​​of the vector
myVector <- c (10, 22, 26, 12)
myVector
range (myVector)

# 11 Logarithm to Base 10
log10 (2)


# 12
myVector <- c (10, 22, 26, 12)
myVector
factor (myVector)

# 13 Media
myVector <- c (10, 22, 26, 12)
myVector
mean (myVector)

# 14 Medium
myVector <- c (9,10, 12, 22, 26,27)
myVector
median (myVector)

# 15 Factorial

factorial (5)

# 16 scala
x <- matrix (1:10, ncol = 2)
(centered.x <- scale (x, scale = FALSE))
cov (centered.scaled.x <- scale (x)) # all 1

# 17 Distribution Quarts
quantile (x, probs = seq (0, 1, 0.25), na.rm = FALSE,
          names = TRUE, type = 7)

# 18 Standard Deviation
x = c (3.0,5.8,5.6,4.8,5.1,3.6,5.5,4.7,5.7,5.0,5.9,5.7,4.4,5.4,4.2,5.3)
sd (x)

# 19 Sumary
x = c (3.0,5.8,5.6,4.8,5.1,3.6,5.5,4.7,5.7,5.0,5.9,5.7,4.4,5.4,4.2,5.3)
summary (x)

# 20 Variance
x = c (3.0,5.8,5.6,4.8,5.1,3.6,5.5,4.7,5.7,5.0,5.9,5.7,4.4,5.4,4.2,5.3)
var (x)

```


### Practice 3

### Intructions

You have been supplied with two vector of data: mounthly revenue and
expenses for the financial year in quiestion. Your task is to calculate
the following financial matrics:

- profit for each mounth
- profit after tax for each month (the tax rate is 30%)
- profit margin for each month - equal to profit after tax divided by revenue
- good months - where the profit after tax was greater than the mean for the year
- bad months - where the profit after tax was less then the mean for years
- the best month - where the profit after tax was max for the year
- the worst month - where the profit after tax was min for the year

All results need to be presented as vectors.

Results for dollar values need to be calculate with $0.01 precision, but need to be
presented in Units of $1,000(i.e. 1k) with no decimal point.

Results for the profit margin ratio needed to be presented in units of % with no
decimal points.

Note: Your collegue has warned you that it is okay for tax for any given month to be
negative (in accounting terms, negative tax translates into a deferred tax asset).

```r
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)


#Revenue Hint 1
round(revenue)
mean(revenue)
max(revenue)
min(revenue)

#Expenses Hint 1
round(expenses)
mean(expenses)
max(expenses)
min(expenses)
  
# Calculate profit as the diffrences between revenue and expenses
profit <- revenue - expenses
profit

#Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
tax <- round(0.30 *profit, 2)
tax 


#Calculate Profit Remaining After Tax Is Deducted
profit.after.tax <- profit - tax
profit.after.tax

#Calculate The Profit Margin As Profit After Tax Over Revenue
#Round To 2 Decimal Points, Then Multiply By 100 To Get %
profit.margin <- round(profit.after.tax /revenue, 2) * 100
profit.margin



#Calculate The Mean Profit After Tax For The 12 Months
mean_pat <- mean(profit.after.tax)
mean_pat

#Find The Months With Above-Mean Profit After Tax
good.months <-  (profit.after.tax)>mean_pat
good.months

#Bad Months Are The Opposite Of Good Months !
bad.months <- !(good.months)
bad.months

#The Best Month Is Where Profit After Tax Was Equal To The Maximum
best.month <- profit.after.tax == max(profit.after.tax)
best.month

#The Worst Month Is Where Profit After Tax Was Equal To The Minimum
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

#Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses/1000,0)
profit.1000 <- round(profit/1000,0)
profit.after.tax.1000 <- round(profit.after.tax/1000, 0)

#Print Results
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month

#Declaring the csv
rcsv <- read.csv("C:\\Users\\Jhovanna Ojeda\\Documents\\Escuela\\DataMining\\Unit_1\\P3.csv", TRUE, ",")

#profit for each mounth
profit <- rcsv$Mounthly.Revenue - rcsv$Expenses


#good months - where the profit after tax was greater than the mean for the year
goodMonths <- rcsv[profitAfter > mean(rcsv$Mounthly.Revenue)]


#the worst month - where the profit after tax was min for the year
min(profitAfter)
```


### Practice 4

### Intructions

You have been supplied data for two more additional in-game statistics:
* Free Throws
* Free Throws Attempts

You need to create three plots that portray the following insights:
* Free Throw Attempts per game
* Accurancy of Free Throws
* Player playing style (2 vs 3 points preference) excluding Free Throws

- Each Free Throw is worth 1 point

The data has been supplied in the form of vectors. You will have to create
two matrices before you proceed with the analysis.

```r
#Seasons
Seasons <- c("2005","2006","2007","2008","2009","2010","2011","2012","2013","2014")

#Players
Players <- c("KobeBryant","JoeJohnson","LeBronJames","CarmeloAnthony","DwightHoward","ChrisBosh","ChrisPaul","KevinDurant","DerrickRose","DwayneWade")

#Free Throws
KobeBryant_FT <- c(696,667,623,483,439,483,381,525,18,196)
JoeJohnson_FT <- c(261,235,316,299,220,195,158,132,159,141)
LeBronJames_FT <- c(601,489,549,594,593,503,387,403,439,375)
CarmeloAnthony_FT <- c(573,459,464,371,508,507,295,425,459,189)
DwightHoward_FT <- c(356,390,529,504,483,546,281,355,349,143)
ChrisBosh_FT <- c(474,463,472,504,470,384,229,241,223,179)
ChrisPaul_FT <- c(394,292,332,455,161,337,260,286,295,289)
KevinDurant_FT <- c(209,209,391,452,756,594,431,679,703,146)
DerrickRose_FT <- c(146,146,146,197,259,476,194,0,27,152)
DwayneWade_FT <- c(629,432,354,590,534,494,235,308,189,284)
#Matrix
#
FreeThrows<-rbind(KobeBryant_FT ,JoeJohnson_FT,LeBronJames_FT,CarmeloAnthony_FT,DwightHoward_FT,ChrisBosh_FT,ChrisPaul_FT,KevinDurant_FT,DerrickRose_FT,DwayneWade_FT)
rm(KobeBryant_FT ,JoeJohnson_FT,LeBronJames_FT,CarmeloAnthony_FT,DwightHoward_FT,ChrisBosh_FT,ChrisPaul_FT,KevinDurant_FT,DerrickRose_FT,DwayneWade_FT)
colnames(FreeThrows) <- Seasons
rownames(FreeThrows) <- Players

#Free Throw Attempts
KobeBryant_FTA <- c(819,768,742,564,541,583,451,626,21,241)
JoeJohnson_FTA <- c(330,314,379,362,269,243,186,161,195,176)
LeBronJames_FTA <- c(814,701,771,762,773,663,502,535,585,528)
CarmeloAnthony_FTA <- c(709,568,590,468,612,605,367,512,541,237)
DwightHoward_FTA <- c(598,666,897,849,816,916,572,721,638,271)
ChrisBosh_FTA <- c(581,590,559,617,590,471,279,302,272,232)
ChrisPaul_FTA <- c(465,357,390,524,190,384,302,323,345,321)
KevinDurant_FTA <- c(256,256,448,524,840,675,501,750,805,171)
DerrickRose_FTA <- c(205,205,205,250,338,555,239,0,32,187)
DwayneWade_FTA <- c(803,535,467,771,702,652,297,425,258,370)
#Matrix
#
FreeThrowAttempts <- rbind(KobeBryant_FTA,JoeJohnson_FTA,LeBronJames_FTA,CarmeloAnthony_FTA,DwightHoward_FTA,ChrisBosh_FTA,ChrisPaul_FTA,KevinDurant_FTA,DerrickRose_FTA,DwayneWade_FTA)
rm(KobeBryant_FTA,JoeJohnson_FTA,LeBronJames_FTA,CarmeloAnthony_FTA,DwightHoward_FTA,ChrisBosh_FTA,ChrisPaul_FTA,KevinDurant_FTA,DerrickRose_FTA,DwayneWade_FTA)
colnames(FreeThrowAttempts) <- Seasons
rownames(FreeThrowAttempts) <- Players

KobeBryant_G <- c(80,77,82,82,73,82,58,78,6,35)
JoeJohnson_G <- c(82,57,82,79,76,72,60,72,79,80)
LeBronJames_G <- c(79,78,75,81,76,79,62,76,77,69)
CarmeloAnthony_G <- c(80,65,77,66,69,77,55,67,77,40)
DwightHoward_G <- c(82,82,82,79,82,78,54,76,71,41)
ChrisBosh_G <- c(70,69,67,77,70,77,57,74,79,44)
ChrisPaul_G <- c(78,64,80,78,45,80,60,70,62,82)
KevinDurant_G <- c(35,35,80,74,82,78,66,81,81,27)
DerrickRose_G <- c(40,40,40,81,78,81,39,0,10,51)
DwayneWade_G <- c(75,51,51,79,77,76,49,69,54,62)
#Matrix
Games <- rbind(KobeBryant_G, JoeJohnson_G, LeBronJames_G, CarmeloAnthony_G, DwightHoward_G, ChrisBosh_G, ChrisPaul_G, KevinDurant_G, DerrickRose_G, DwayneWade_G)
rm(KobeBryant_G, JoeJohnson_G, CarmeloAnthony_G, DwightHoward_G, ChrisBosh_G, LeBronJames_G, ChrisPaul_G, DerrickRose_G, DwayneWade_G, KevinDurant_G)
colnames(Games) <- Seasons
rownames(Games) <- Players


KobeBryant_PTS <- c(2832,2430,2323,2201,1970,2078,1616,2133,83,782)
JoeJohnson_PTS <- c(1653,1426,1779,1688,1619,1312,1129,1170,1245,1154)
LeBronJames_PTS <- c(2478,2132,2250,2304,2258,2111,1683,2036,2089,1743)
CarmeloAnthony_PTS <- c(2122,1881,1978,1504,1943,1970,1245,1920,2112,966)
DwightHoward_PTS <- c(1292,1443,1695,1624,1503,1784,1113,1296,1297,646)
ChrisBosh_PTS <- c(1572,1561,1496,1746,1678,1438,1025,1232,1281,928)
ChrisPaul_PTS <- c(1258,1104,1684,1781,841,1268,1189,1186,1185,1564)
KevinDurant_PTS <- c(903,903,1624,1871,2472,2161,1850,2280,2593,686)
DerrickRose_PTS <- c(597,597,597,1361,1619,2026,852,0,159,904)
DwayneWade_PTS <- c(2040,1397,1254,2386,2045,1941,1082,1463,1028,1331)
#Matrix
Points <- rbind(KobeBryant_PTS, JoeJohnson_PTS, LeBronJames_PTS, CarmeloAnthony_PTS, DwightHoward_PTS, ChrisBosh_PTS, ChrisPaul_PTS, KevinDurant_PTS, DerrickRose_PTS, DwayneWade_PTS)
rm(KobeBryant_PTS, JoeJohnson_PTS, LeBronJames_PTS, CarmeloAnthony_PTS, DwightHoward_PTS, ChrisBosh_PTS, ChrisPaul_PTS, KevinDurant_PTS, DerrickRose_PTS, DwayneWade_PTS)
colnames(Points) <- Seasons
rownames(Points) <- Players

# Field Throw per game
round(FreeThrowAttempts / Games, 1)


matplot(t(FreeThrowAttempts/Games), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)


## Acuaracy of free trwos
round(FreeThrowAttempts / FreeThrows, 1)

matplot(t(FreeThrowAttempts/FreeThrows), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)


## Player style
round(Points/Games)

matplot(t(Points/Games), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)
```


### Practice 5
### Instructions

```r
#Practice5
#Filter the countries by Income
stats[stats$Income.Group == "Low income",]
stats[stats$Income.Group == "Lower middle income",]
stats[stats$Income.Group == "Upper middle income",]

#Filter by countries Name
stats[stats$Country.Name == "Malta",]
stats[stats$Country.Name == "Qatar",]
stats[stats$Country.Name == "Netherlands",]
stats[stats$Country.Name == "Norway",]
```
