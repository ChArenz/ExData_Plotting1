# Set working Directory
setwd("~/R-Programme/Electric Power Consumption")

#Read household_power_consumption data
powerConsFile <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?",stringsAsFactors=FALSE, dec=".")

# Set format for Date
powerConsFile$Date <- as.Date(powerConsFile$Date, format="%d/%m/%Y")

# Subsetting the Daterange from 2007-02-01 until 2007-02-02
powerConsData <- subset(powerConsFile, powerConsFile$Date >= "2007-02-01" & powerConsFile$Date <= "2007-02-02")

# Dataset for Plot 
globalActivePower <- as.numeric(powerConsData$Global_active_power)

# Create Histogram and png export
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()