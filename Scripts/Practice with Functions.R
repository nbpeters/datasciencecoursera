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
  nc <- ncol(y) #set number of columns in data frame
  means <- numeric(nc) # Numeric vector that will hold the resulting means from each column
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA) #loop through dataframe and store mean in means object
  }
  #Still need to return something from this function so time to call the means object
  means
}
