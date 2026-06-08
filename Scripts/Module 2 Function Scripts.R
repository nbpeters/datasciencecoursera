#-----------------Coursera Module 2 Assignment----------------
# Function 1 ----- pollutantmean -----------------------------
pollutantmean <- function(dataDirectory, pollutant, id = 1:332){
  #setwd(dataDirectory)
  tableVec <- numeric()
  for(i in id){
    #settting id to character vector matching monitor file
    if(i < 10){
      tablename <- paste("00",i,".csv", sep = "")
    }
    else if(i < 100){
      tablename <- paste("0",i,".csv", sep = "")
    }
    else {
      tablename <- paste(i,".csv", sep = "")
    }
    tablepath <- file.path(dataDirectory, tablename)
    #assigning current monitor table to an object for summation before mean
    looptable <- read.csv(tablepath)
    #summing non-NA values into total tableSum object
    tableVec <- c(tableVec, looptable[[pollutant]]) 
    
    # rows <- rows + sum(!is.na(looptable[[pollutant]]))
  }
  mean(tableVec, na.rm = TRUE)
  #tableSum/rows
}

    