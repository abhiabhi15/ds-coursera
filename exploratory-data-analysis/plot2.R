source("readData.R")

sketchPlot2 <- function(){
  tbl <- getData()
  png(filename = "plot2.png",width = 480, height = 480, units = "px")
  plot(tbl$DateTime, tbl$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}

sketchPlot2()