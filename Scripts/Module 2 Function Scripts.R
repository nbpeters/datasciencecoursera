#-----------------Coursera Module 2 Assignment----------------
# Function 1 ----- pollutantmean -----------------------------
pollutantmean <- function(dataDirectory, pollutant, id = 1:332){
  #creating an empty numeric vector for pollutant data entries to fill for later
  #mean calculation
  tableVec <- numeric()
  for(i in id){
    #creating a character vector matching monitor file for path finding
    if(i < 10){
      tablename <- paste("00",i,".csv", sep = "")
    }
    else if(i < 100){
      tablename <- paste("0",i,".csv", sep = "")
    }
    else {
      tablename <- paste(i,".csv", sep = "")
    }
    
    #creating a path to the monitor file to be executed within the loop instead
    #of relying on changing the global working directory to the Data folder
    tablepath <- file.path(dataDirectory, tablename)
    
    #assigning current monitor table to an object for summation into a single vector
    #before mean function
    looptable <- read.csv(tablepath)
    
    #summing non-NA values into a total tableSum object/vector
    tableVec <- c(tableVec, looptable[[pollutant]]) 
  }
  mean(tableVec, na.rm = TRUE)
  #could set return here for good practice but since mean is final expression
  #this alone should suffice
}

    