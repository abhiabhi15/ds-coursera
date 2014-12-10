## The function poullutantmean takes the argument of directory and the file ids, 
## to caluclate the means of the given pollutant

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  alldata <- data.frame()
  for( i in id){
    alldata <- rbind(alldata, extractData(directory, i))
  }
  round(mean(alldata[,pollutant], na.rm = TRUE), 3)
}

extractData <- function(directory, id){

    id <- sprintf("%03d", id)
    fileName <- paste(paste(directory, id, sep ="/"), "csv", sep =".")
    read.csv(fileName)
}