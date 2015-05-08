## Load file

if (!file.exists("./household_power_consumption.txt")) {
  zipFile <- tempfile()
  fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,zipFile)
  powerFile <- unzip(zipFile)
  # remove zipFile
  unlink(zipFile)
}else{
  powerFile = "./household_power_consumption.txt"
}

## Subset file using data from the dates 2007-02-01 and 2007-02-02
powerTable  <- read.table(powerFile, header=TRUE, sep=";", na.strings="?")
powerTable  <-  powerTable[powerTable$Date=='1/2/2007' | powerTable$Date=='2/2/2007',]
powerTable$DateTime <- strptime(paste(as.Date(powerTable$Date,"%d/%m/%Y"),powerTable$Time), format="%Y-%m-%d %H:%M:%S")
