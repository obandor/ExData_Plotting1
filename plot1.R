
plot1 <- function() {
  hist(powerTable$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
}

############ 
## to make this source code self contained, load the file from here:
############ 
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
## Invoke plot1 function
#########
plot1()