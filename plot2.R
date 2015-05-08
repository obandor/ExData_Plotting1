############ 
## Function plot2
## Creates a plot with the given data set.
############

plot2 <- function() {
  plot(powerTable$DateTime,powerTable$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
}

## Note: to make this source code self contained, load the file from here:
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

##########
## Invoke plot2 function
#########
plot2()