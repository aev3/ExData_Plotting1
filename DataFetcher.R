# 
# Add library dependency for using 'read.csv.sql' 
#
library(sqldf)
#
# Set up and clean up data.
#
fetchData <- function() {
  # 
  # The datafile pointer.
  #
  datafile <- "household_power_consumption.txt"
  #
  # Check to see if the `datafile` is already downloaded. If it does not,
  # then download it. Otherwise, print out an acknowledgement of the 
  # datafile's existence.
  if(!file.exists(datafile)) {
    download.file(
      "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
      destfile="household_power_consumption.txt",
      method="curl")
  } else {
    print("Datafile already exists.")
  }
  
  # 
  # Use a sql type statement to SELECT to get correct dates.
  #
  selector <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  
  #
  # Read the dataframe using the selector defined above.
  #
  Data <- read.csv.sql(datafile, sql=selector, sep=";")
  
  #
  # Read in the data and convert date and time columns.
  #
  Data$DateTime <- as.POSIXct(strptime(paste(Data$Date,Data$Time), "%d/%m/%Y %H:%M:%S"))
  
  return(Data)
}

