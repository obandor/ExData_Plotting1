plot4 <- function() {
  par(mfrow=c(2,2))
  ##Global_active_power
  plot(powerTable$DateTime,powerTable$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  ##Voltage
  plot(powerTable$DateTime,powerTable$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##Energy Sub_metering
  plot(powerTable$DateTime,powerTable$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(powerTable$DateTime,powerTable$Sub_metering_2,col="red")
  lines(powerTable$DateTime,powerTable$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
  
  #Global_reactive_power
  plot(powerTable$DateTime,powerTable$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

  dev.copy(png, file="plot4.png", width=480, height=480)
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
## Invoke plot4 function
#########
plot4()
