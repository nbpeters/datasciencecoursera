#-------------Practice with Functions-------------------------

add2 <- function(x,y) {
  x + y
}

above10 <- function(x){
  use <- x > 10
  x[use]
}

above <- function(x, n = 10) {
  use <- x > n
  x[use]
}

columnMeans <- function(y, removeNA = TRUE){
  #set number of columns in data frame
  nc <- ncol(y)
  # Numeric vector that will hold the resulting means from each column
  means <- numeric(nc) 
  for(i in 1:nc){
    #loop through dataframe and store mean in means object
    means[i] <- mean(y[,i], na.rm = removeNA) 
  }
  #Still need to return something from this function 
  #so time to call the means object
  means
}
