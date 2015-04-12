# Set working Directory
setwd("~/R-Programme/Electric Power Consumption")

#Read household_power_consumption data
powerConsFile <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE, dec=".")

# Set format for Date
powerConsFile$Date <- as.Date(powerConsFile$Date, format="%d/%m/%Y")

# Subsetting the Daterange from 2007-02-01 until 2007-02-02
powerConsData <- subset(powerConsFile, powerConsFile$Date >= "2007-02-01" & powerConsFile$Date <= "2007-02-02")

# Combine Date and Time
datetime <- paste(as.Date(powerConsData$Date), powerConsData$Time)
powerConsData$Datetime <- as.POSIXct(datetime)

# Create plot and png File
png("plot4.png", width=480, height=480) #initialize file

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(powerConsData, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off() # close file