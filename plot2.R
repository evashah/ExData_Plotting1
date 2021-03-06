# Exploratory Data Analysis
# Coursera
# John Hopkins University

# Week 1 - Assignment for Peer Review - Plot 2

#read data from text file
url <- "household_power_consumption.txt"
Data <- read.table(url, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset data based on date
subsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(Data)
summary(subsetData) # check the class for each column
DateandTime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subsetData$Global_active_power) # convert Global Active Power data to numeric

# plot graph
png("plot2.png", width=480, height=480)
plot(DateandTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
