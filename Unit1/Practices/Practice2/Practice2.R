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

