#
# Source the DataFetcher script to include its `fetchData()` function,
# which function returns the dataframe used by this script.
#
source("DataFetcher.R")
Data <- fetchData()
#
# Open the png graphics device.
#
png(filename = "plot2.png",
  width = 480, 
  height = 480, 
  units = "px", 
  bg = "white")

#
# Create line plot.
#
plot(Data$DateTime,
  Data$Global_active_power,type="l",
  xlab="",
  ylab="Global Active Power (kilowatts)")
#
# Shut down the specified (by default the current) device.
#
dev.off()
#
#
# EoF
