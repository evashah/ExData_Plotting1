# Exploratory Data Analysis
# Coursera
# John Hopkins University

# Week 1 - Assignment for Peer Review - Plot 4

#read data from text file
url <- "household_power_consumption.txt"
Data <- read.table(url, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset data based on date
subsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(Data)
summary(subsetData) # check the class for each column
DateandTime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subsetData$Global_active_power) # convert Global Active Power data to numeric
GlobalReactivePower <- as.numeric(subsetData$Global_reactive_power) # convert Global Active Power data to numeric
Voltage <- as.numeric(subsetData$Voltage) # convert Voltage data to numeric
SubMetering1 <- as.numeric(subsetData$Sub_metering_1)
SubMetering2 <- as.numeric(subsetData$Sub_metering_2)

# plot all 4 graphs
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# graph 1
plot(DateandTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")

# graph 2
plot(DateandTime, Voltage, type="l", xlab="datetime", ylab="Voltage")

# graph 3
plot(DateandTime, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateandTime, SubMetering2, type="l", col="red")
lines(DateandTime, subsetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"),bty="n")

# graph 4
plot(DateandTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") # graph 4

dev.off()
