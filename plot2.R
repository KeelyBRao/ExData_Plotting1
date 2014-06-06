# This file assumes that the corresponding TXT file is downloaded and ready for use.
fileName = "./household_power_consumption.txt" # file name for the TXT file
# Data is red using read.table and NA are represented as ? in the text file
data <- read.table(fileName,sep=";", header=TRUE, na.strings = "?");
#  convert between character representations and objects of classes "POSIXlt" and "POSIXct"
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
#data$datetime <- as.Date(data$Date,"%d/%m/%Y")
# subset the selection between the selected dates
dateInterval <- c(as.Date("2007-02-01"), as.Date("2007-02-02"));
dataLimited <- data[as.Date(data$datetime) %in% dateInterval,]
# PLOT1.PNG file creation
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(dataLimited$datetime, dataLimited$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()