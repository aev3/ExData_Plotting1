#
# Source the DataFetcher script to include its `fetchData()` function,
# which function returns the dataframe used by this script.
#
source("DataFetcher.R")
Data <- fetchData()
#
# Open the png graphics device.
#
png(filename = "plot4.png",
  width = 480, 
  height = 480, 
  units = "px", 
  bg = "white")

par(mfrow=c(2,2))

#plot 1
plot(Data$DateTime,
  Data$Global_active_power,
  type="l",
  xlab="",
  ylab="Global Active Power")

#plot 2
plot(Data$DateTime,
  Data$Voltage,
  type="l",
  xlab="datetime",
  ylab="Voltage")

#plot 3 
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

#plot 2 again
plot(Data$DateTime,
  Data$Global_reactive_power,
  type="l",
  xlab="datetime",
  ylab="Global_reactive_power")
#
# Shut down the specified (by default the current) device.
#
dev.off()
#
#
# EoF
