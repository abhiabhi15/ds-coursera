

best <- function(state, outcome) {

  if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
      stop("invalid outcome")
  }
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
 
  states <- table(data$State)
  if(!state %in% names(states)){
    stop("invalid state")
  }

  subData <- subset(data, State == state)
  
  index <- if(outcome == "heart attack"){
              11 
            }else if(outcome == "heart failure"){
              17
            }else{
              23  
  }
  
  subData[, index] <- suppressWarnings(as.numeric(subData[,index]))
  subData <- na.omit(subData)
  subData <- subData[order(subData[,index], na.last = TRUE), 2]
  subData <- na.omit(subData)
  subData[1]
   
}

