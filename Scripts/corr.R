#-----------------Coursera Module 2 Assignment --------------------------------
# Function 3 ----- corr -------------------------------------------------------
corr <- function(dataDirectory, threshold = 0){
  #object containing all character strings of file names
  files <- list.files(dataDirectory)
  
  #converting the character strings into a numeric vector and deleting the .csv 
  #portion using sub()
  # \\. means "match a literal dot."$ means "match the end of the string."
  monitorIds <- as.numeric(sub("\\.csv$","", files))
  
  #creating an empty numeric vector to hold cor() outputs
  CorOverThresh <- numeric()
  
  #starting analysis and looping through all files
  for(i in monitorIds){
    
    #turning the monitor id into a string to find the csv when path finding next
    if(i < 10){
      tablename <- paste("00", i, ".csv", sep = "")
    }
    else if (i < 100){
      tablename <- paste("0", i, ".csv", sep = "")
    }
    else{
      tablename <- paste(i, ".csv", sep = "")
    }
    
    #path finding the table and assigning it to an object for analysis
    filePath <- file.path(dataDirectory, tablename)
    
    #assigning monitor being read to a object so it can be analyzed for complete
    #entries before threshold test and correlation analysis
    loopTable <- read.csv(filePath)
    
    #Determining amount of complete entries
    completeObs <- sum(!is.na(loopTable[["sulfate"]]) &
                         !is.na(loopTable[["nitrate"]]))
    
    #testing if complete observations are over threshold and then performing 
    #cor() if it does meet threshold and adding the output to the CorOverThresh
    #numeric vector
    #NOTE complete.obs used to eliminate NAs from correlation anaylsis
    if (completeObs > threshold){
      CorOverThresh <- 
        c(CorOverThresh, 
          cor(loopTable$sulfate, loopTable$nitrate, use = "complete.obs"))
    }
  } 
  CorOverThresh
}