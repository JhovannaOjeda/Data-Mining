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

#Declaring the csv
rcsv <- read.csv("C:\\Users\\Jhovanna Ojeda\\Documents\\Escuela\\DataMining\\Unit_1\\P3.csv", TRUE, ",")

#profit for each mounth
profit <- rcsv$Mounthly.Revenue - rcsv$Expenses


#good months - where the profit after tax was greater than the mean for the year
goodMonths <- rcsv[profitAfter > mean(rcsv$Mounthly.Revenue)]


#the worst month - where the profit after tax was min for the year
min(profitAfter)
