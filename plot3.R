library("data.table")
library("dplyr")

## Source file has been downloaded and unzipped into "data" folder in current working directory.

## load the source file into R and subset for the required dates.
epsource <- fread("data/household_power_consumption.txt",na.strings = "?")
epsub <- filter(epsource, grep("^[1,2]/2/2007", Date))

## Open a png device.
png("plot3.png", width=480, height=480)

## Create plot 3 - Energy sub metering Vs datetime
plot(strptime(paste(epsub$Date, epsub$Time), "%d/%m/%Y %H:%M:%S"),epsub$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
with(epsub, points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "l"))
with(epsub, points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, type = "l", col = "red"))
with(epsub, points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

## close the PNG device.
dev.off() 
