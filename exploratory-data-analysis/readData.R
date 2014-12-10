getData <- function(){
  
  cacheFile <- "./data/power-data.csv"
  if(file.exists(cacheFile)){
      myTbl <- read.csv(cacheFile)
      myTbl$DateTime <- strptime(paste(myTbl$Date, myTbl$Time), "%d/%m/%Y %H:%M:%S")
  }else{
    myTbl <- read.table("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
    myTbl <- myTbl[(myTbl$Date == "1/2/2007") | (myTbl$Date == "2/2/2007"),]
    myTbl$DateTime <- strptime(paste(myTbl$Date, myTbl$Time), "%d/%m/%Y %H:%M:%S")
    write.csv(myTbl, cacheFile)
  }
  myTbl
}


