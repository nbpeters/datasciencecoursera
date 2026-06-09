#-----------------Coursera Module 2 Assignment --------------------------------
# Function 2 ----- complete ---------------------------------------------------
complete <- function(dataDirectory, id = 1:332){
  #Creating numeric vectors that will be used as args for the output data
  #frame
  idscolumn <- id
  nobscolumn <- numeric()
  for(i in id){
    #turning the monitor id into a string to find the csv when path finding next
    if(i < 10){
      tablename <- paste("00", i, ".csv", sep = "")
    }
    else if(i < 100){
      tablename <- paste("0", i, ".csv", sep = "")
    }
    else {
      tablename <- paste(i, ".csv", sep = "")
    }
    
    #path finding the table and assigning it to an object for analysis
    tablepath <- file.path(dataDirectory, tablename)
    
    #assigning monitor being read to a object so it can be analyzed for complete
    #entries
    looptable <- read.csv(tablepath)
    
    #determining how many completely observed entries are contained in the 
    #current monitor table
    nobs <- sum(!is.na(looptable[["sulfate"]]) & !is.na(looptable[["nitrate"]]))
    
    #adding to a numeric vector that will become the nobs column of final
    #data frame output
    nobscolumn <- c(nobscolumn, nobs)
  }
  output <- data.frame(id = idscolumn, nobs = nobscolumn)
  output
}
