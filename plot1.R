#
# Source the DataFetcher script to include its `fetchData()` function,
# which function returns the dataframe used by this script.
#
source("DataFetcher.R")
Data <- fetchData()
#
# Open the png graphics device.
#
png(filename = "plot1.png",
  width = 480, 
  height = 480, 
  units = "px", 
  bg = "white")
#
# Create histogram.
#
hist(Data$Global_active_power,
  main="Global Active Power",
  xlab="Global Active Power (Killowats)",
  col="red",
  ylim=c(0,1200))
#
# Shut down the specified (by default the current) device.
#
dev.off()
#
#
# EoF
