rankall <- function(outcome, num = "best") {
    
  if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
    stop("invalid outcome")
  }
  
  index <- if(outcome == "heart attack"){
    11 
  }else if(outcome == "heart failure"){
    17
  }else{
    23  
  }
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- table(data$State)
  states <- names(states)
  
  hospital <- character()
  for(state in states){
      hospital <- c(hospital, _myrankhospital(data, index, state, num))  
  }
  
  output <- data.frame(hospital, state = states)
  output
 
}

# Optimized version of rankhospital code
_myrankhospital <- function (data, index, state, num ){
  subData <- subset(data, State == state)
    
  subData[, index] <- suppressWarnings(as.numeric(subData[,index]))
  subData <- na.omit(subData)
  subData <- subData[order(subData[,index], subData[,2], na.last = TRUE), 2]
  subData <- na.omit(subData)
  
  hrank <- if(num == "best"){
    1
  }else if(num == "worst"){
    length(subData)
  }else{
    as.numeric(num)
  }
  subData[hrank]
}
