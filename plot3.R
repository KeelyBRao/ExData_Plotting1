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
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(dataLimited$datetime, dataLimited$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dataLimited$datetime, dataLimited$Sub_metering_2, type="l", col="red")
lines(dataLimited$datetime, dataLimited$Sub_metering_3, type="l", col="blue")
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
dev.off()
