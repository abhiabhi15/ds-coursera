complete <- function(directory, id = 1:332) {
 
  nobs = numeric(0)
  for(i in id){
     rowCount <- nrow(na.omit(extractData(directory, i)))
     nobs <- c( nobs, rowCount)
  }
  data.frame(id = id, nobs = nobs)
}