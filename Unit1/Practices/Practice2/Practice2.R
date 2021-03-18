#1 Elimina decimales de un numero
trunc(1.999999)

#2 Muestra los numeros de elementos de un vector
x <- 1:30  
length(x)

#3 Se redondean los numeros decimales indicados en este caso 1
round(6.78,1)

#4 Genera n numeros al azar entre los numeros indicados
runif(5,1,10)

#5 Redondeo al numero entero superior
ceiling(9.1)

#6 Redondeo al numero entero inferior
floor(9.1)

#7 Suma de los valores

sum(1, 2, 3, 4, 5)

#8 Funcion exponencial
exp(3)

# 9 valor absoluto
abs(4)

#10 Valores minimo y maximo del vector
myVector <- c(10, 22, 26, 12)
myVector
range(myVector)

#11 Logaritmo en Base 10
log10(2)


#12
myVector <- c(10, 22, 26, 12)
myVector
factor(myVector)

# 13 Media
myVector <- c(10, 22, 26, 12)
myVector
mean(myVector)

# 14 Mediana
myVector <- c(9,10, 12, 22, 26,27)
myVector
median(myVector)

# 15 Factorial

factorial(5)

# 16 scala
x <- matrix(1:10, ncol = 2)
(centered.x <- scale(x, scale = FALSE))
cov(centered.scaled.x <- scale(x)) # all 1

# 17 Cuartilles de distribucion
quantile(x, probs = seq(0, 1, 0.25), na.rm = FALSE,
         names = TRUE, type = 7)

# 18 Desviacion standart
x=c(3.0,5.8,5.6,4.8,5.1,3.6,5.5,4.7,5.7,5.0,5.9,5.7,4.4,5.4,4.2,5.3)
sd(x)

#19 Sumary
x=c(3.0,5.8,5.6,4.8,5.1,3.6,5.5,4.7,5.7,5.0,5.9,5.7,4.4,5.4,4.2,5.3)
summary(x)

#20 Varianza
x=c(3.0,5.8,5.6,4.8,5.1,3.6,5.5,4.7,5.7,5.0,5.9,5.7,4.4,5.4,4.2,5.3)
var(x)

