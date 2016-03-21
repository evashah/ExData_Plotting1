# Exploratory Data Analysis
# Coursera
# John Hopkins University

# Week 1 - Assignment for Peer Review - Plot 1

# check / set working directory
rm(list=ls())
getwd()
setwd("C:/Users/SV Tech Holdings/Documents/GitHub")

#read data from text file
url <- "household_power_consumption.txt"
Data <- read.table(url, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset data based on date
subsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(Data)
summary(subsetData) # check the class for each column
GlobalActivePower <- as.numeric(subsetData$Global_active_power) # convert Global Active Power data to numeric

# plot histogram and save to png file
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
