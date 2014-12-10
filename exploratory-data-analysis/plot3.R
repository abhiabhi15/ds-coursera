source("readData.R")

sketchPlot3 <- function(){
  
  tbl <- getData()
  png(filename= "plot3.png", width = 480, height = 480, units = "px")
  plot(tbl$DateTime, tbl$Sub_metering_1, type ="l", xlab="", ylab = "Energy Sub Metering")
  lines(tbl$DateTime, tbl$Sub_metering_2, type ="l", col= "red")
  lines(tbl$DateTime, tbl$Sub_metering_3, type = "l", col ="blue")
  cols = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3")
  legend("topright",lty=1, lwd=1, col = c("black","red","blue"),legend=cols)
  dev.off()
}

sketchPlot3()