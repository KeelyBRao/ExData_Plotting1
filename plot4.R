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

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(dataLimited$datetime, dataLimited$Global_active_power, xlab="", ylab="Global Active Power", type="l")
plot(dataLimited$datetime, dataLimited$Voltage, xlab="datetime", ylab="Voltage", type="l")
plot(dataLimited$datetime, dataLimited$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dataLimited$datetime, dataLimited$Sub_metering_2, type="l", col="red")
lines(dataLimited$datetime, dataLimited$Sub_metering_3, type="l", col="blue")
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")
plot(dataLimited$datetime, dataLimited$Global_reactive_power, xlab="datetime", ylab="Global Active Power", type="l")
#data$Date2 <- as.Date( as.character(data$Date), "%d-%m-%y")
dev.off()