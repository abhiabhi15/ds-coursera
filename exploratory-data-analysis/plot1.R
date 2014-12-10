source("readData.R")

sketchPlot1 <- function(){
  tbl <- getData()
  png(filename = "plot1.png",width = 480, height = 480, units = "px")
  hist(tbl$, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
  dev.off()
}

sketchPlot1()