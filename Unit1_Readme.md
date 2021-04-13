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
### Examen

### Practice 1
### Intructions
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
### Examen
### Instructions
Develop The Following Problem With R And Rstudio Using Dataframes For The
Extraction Of Knowledge That The Problem Requires.
The World Bank Was Very Impressed With Their Delivery In The Previous Allocation And
They Have A New Project For You.

You Should Generate A Scatter-Plot That Shows The
Life Expectancy Statistics (Y-Axis) And Fertility Rate
(Fertility Rate -X Axis) By Country (Country).

The Scatter Plot Should Also Be Classified By Country Regions (Country
Regions).

You Have Been Provided Data For 2 Years: 1960 And 2013 And You Are Required To
Produce A Visualization For Each Of These Years.
Some Data Has Been Provided In A Cvs File, Some In R Vectors. The
Cvs File Contains Combined Data From Both Years. All Data Manipulation
Should Be Done In R (Not In Excel) Because This Project Can Be Audited In A
Later Stage.

You Have Also Been Asked To Provide Information On How The
Two Periods. (Hint: Basically The Explanation Of His Observations)
Note:
The Files To Perform This Practice Are Countryregionvectors.R And
Dataframeevaluation_data.Csv Is Located In The Google Drive Folder
Shared Resources / Information-Ui:
Evaluation Instructions
- Delivery Time April 13, 2021
- When Finished Put The Code And Documentation With Its Explanation In The Branch
Corresponiete Of Your Github, Also Make Your Explanation Of The Solution In Your
Google Drive In Google Document (Cover, Introduction, Development, Etc).
- Finally Defend Its Development In A 6-8 Min Video Explaining Its Solution And
Comments, This Will Serve To Give Your Qualification Of This Evaluation Practice, This
Video Must Be Uploaded To Youtube To Be Shared By A Public Link (Use
Google Meet With The Cameras On And Record Your Defense To Raise The
Video).
Happy Coding :)!

```r
#Exam Unit 1
#Charging the csv
countries <- read.csv(file.choose())
head(countries, 10)
# Charging the csv
goverment <- read.csv(file.choose())
goverment

#Creating a dataframe with data of the vectors
Country_Code <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","WSM","YEM","ZAF","COD","ZMB","ZWE")
Life_Expectancy_At_Birth_1960 <- c(65.5693658536586,32.328512195122,32.9848292682927,62.2543658536585,52.2432195121951,65.2155365853659,65.8634634146342,61.7827317073171,70.8170731707317,68.5856097560976,60.836243902439,41.2360487804878,69.7019512195122,37.2782682926829,34.4779024390244,45.8293170731707,69.2475609756098,52.0893658536585,62.7290487804878,60.2762195121951,67.7080975609756,59.9613658536585,42.1183170731707,54.2054634146342,60.7380487804878,62.5003658536585,32.3593658536585,50.5477317073171,36.4826341463415,71.1331707317073,71.3134146341463,57.4582926829268,43.4658048780488,36.8724146341463,41.523756097561,48.5816341463415,56.716756097561,41.4424390243903,48.8564146341463,60.5761951219512,63.9046585365854,69.5939268292683,70.3487804878049,69.3129512195122,44.0212682926829,72.1765853658537,51.8452682926829,46.1351219512195,53.215,48.0137073170732,37.3629024390244,69.1092682926829,67.9059756097561,38.4057073170732,68.819756097561,55.9584878048781,69.8682926829268,57.5865853658537,39.5701219512195,71.1268292682927,63.4318536585366,45.8314634146342,34.8863902439024,32.0422195121951,37.8404390243902,36.7330487804878,68.1639024390244,59.8159268292683,45.5316341463415,61.2263414634146,60.2787317073171,66.9997073170732,46.2883170731707,64.6086585365854,42.1000975609756,68.0031707317073,48.6403170731707,41.1719512195122,69.691756097561,44.945512195122,48.0306829268293,73.4286585365854,69.1239024390244,64.1918292682927,52.6852682926829,67.6660975609756,58.3675853658537,46.3624146341463,56.1280731707317,41.2320243902439,49.2159756097561,53.0013170731707,60.3479512195122,43.2044634146342,63.2801219512195,34.7831707317073,42.6411951219512,57.303756097561,59.7471463414634,46.5107073170732,69.8473170731707,68.4463902439024,69.7868292682927,64.6609268292683,48.4466341463415,61.8127804878049,39.9746829268293,37.2686341463415,57.0656341463415,60.6228048780488,28.2116097560976,67.6017804878049,42.7363902439024,63.7056097560976,48.3688048780488,35.0037073170732,43.4830975609756,58.7452195121951,37.7736341463415,59.4753414634146,46.8803902439024,58.6390243902439,35.5150487804878,37.1829512195122,46.9988292682927,73.3926829268293,73.549756097561,35.1708292682927,71.2365853658537,42.6670731707317,45.2904634146342,60.8817073170732,47.6915853658537,57.8119268292683,38.462243902439,67.6804878048781,68.7196097560976,62.8089268292683,63.7937073170732,56.3570487804878,61.2060731707317,65.6424390243903,66.0552926829268,42.2492926829268,45.6662682926829,48.1876341463415,38.206,65.6598292682927,49.3817073170732,30.3315365853659,49.9479268292683,36.9658780487805,31.6767073170732,50.4513658536585,59.6801219512195,69.9759268292683,68.9780487804878,73.0056097560976,44.2337804878049,52.768243902439,38.0161219512195,40.2728292682927,54.6993170731707,56.1535365853659,54.4586829268293,33.7271219512195,61.3645365853659,62.6575853658537,42.009756097561,45.3844146341463,43.6538780487805,43.9835609756098,68.2995365853659,67.8963902439025,69.7707317073171,58.8855365853659,57.7238780487805,59.2851219512195,63.7302195121951,59.0670243902439,46.4874878048781,49.969512195122,34.3638048780488,49.0362926829268,41.0180487804878,45.1098048780488,51.5424634146342)
df60 <- data.frame(Country.Code=Country_Code, Life.Expectancy_1960=Life_Expectancy_At_Birth_1960)
head(df60, 10)

#Merging both CSV and vectors data for 1960
filter60 <- countries[countries$Year == 1960,]
head(filter60,10)
FullData60 <- merge(filter60, df60, by.x = "Country.Code", by.y = "Country.Code")
head(FullData60, 10)

#Creating the plot for 1960
qplot(data = FullData60, x = Fertility.Rate, y = Life.Expectancy_1960, color = Region, 
      main = "Fertility Rate vs Life Expentancy in 1960 by Country")


### Year 2013
# Create Dataframe
dataCountry <- data.frame(Code= Country_Code, Life_2013=Life_Expectancy_At_Birth_2013)

#First elements
head(dataCountry)
# last elements
tail(dataCountry)

# Filter year 2013
filterCountry2013 <- goverment$Year ==2013
filterCountry2013

stats_2013 <- goverment[filterCountry2013,]
stats_2013

# Merged 
merged <- merge(goverment, dataCountry, by.x = "Country.Code", by.y = "Code")
head(merged)
tail(merged)

#  Library scater plot 
library(ggplot2)
# year 2013
<<<<<<< HEAD
qplot(data=merged, x=Fertility.Rate, y=Life_2013, size=I(5),color=I("violet"))
=======
qplot(data = merged, x = Fertility.Rate, y = Life_2013, color = Region, 
      main = "Fertility Rate vs Life Expentancy in 2013 by Country")
```
