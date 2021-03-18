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
