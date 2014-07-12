#
# Source the DataFetcher script to include its `fetchData()` function,
# which function returns the dataframe used by this script.
#
source("DataFetcher.R")
Data <- fetchData()
#
# Open the png graphics device.
#
png(filename = "plot3.png",
  width = 480, 
  height = 480, 
  units = "px", 
  bg = "white")

plot(x=Data$DateTime,
  y=Data$Sub_metering_1,
  type="l",
  xlab="",
  ylab="Energy Sub Meetering")

lines(x=Data$DateTime,
  y=Data$Sub_metering_2, 
  type="l",
  col="red")

lines(x=Data$DateTime,
  y=Data$Sub_metering_3, 
  type="l",
  col="blue")

legendTxt <-c("Sub Meetering 1","Sub Meetering 2", "Sub Meetering 3")

legend("topright",
  c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),
  lty=c(1,1,1),
  lwd=c(2.5,2.5,2.5),
  col=c("black","blue","red")
  )
#
# Shut down the specified (by default the current) device.
#
dev.off()
#
#
# EoF
