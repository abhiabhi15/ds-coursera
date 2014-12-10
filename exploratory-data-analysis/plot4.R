source("readData.R")

sketchPlot4 <- function(){
  
  tbl <- getData()
  png(filename = "plot4.png", width = 480, height = 480, units = "px")
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(tbl, {
    plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
    
    plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    plot(DateTime, Sub_metering_1, type ="l", xlab="", ylab = "Energy Sub Metering")
    lines(DateTime, Sub_metering_2, type ="l", col= "red")
    lines(DateTime, Sub_metering_3, type = "l", col ="blue")
    cols = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3")
    legend("topright",lty=1, lwd=1, col = c("black","red","blue"),legend=cols, bty="n")
    
    plot(DateTime, Global_reactive_power, xlab="datetime", ylab ="Global_reactive_power", type ="l")
    
  })
    
  dev.off()
  
}

sketchPlot4()