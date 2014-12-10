corr <- function(directory, threshold = 0) {
   corr <- numeric(0)
  for(i in 1:length(list.files(directory))){
      
    myData <- na.omit(extractData(directory, i))
      rowCount <- nrow(myData)
      
      if(rowCount > threshold){
          localCr <- round(cor(myData$sulfate, myData$nitrate),5)
          if(!is.na(localCr)){
              corr <- c(corr, localCr)
          }
      }
  }    
  corr
}