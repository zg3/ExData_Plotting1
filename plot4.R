library("data.table")
library("dplyr")

## Source file has been downloaded and unzipped into "data" folder in current working directory.

## load the source file into R and subset for the required dates.
epsource <- fread("data/household_power_consumption.txt",na.strings = "?")
epsub <- filter(epsource, grep("^[1,2]/2/2007", Date))

## Create plot 4
## Open a png device and setup the plot area for 4 plots

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2),mar=c(4,4,2,1))

# Plot (1,1) - Global Active Power Vs datetime
plot(strptime(paste(epsub$Date, epsub$Time), "%d/%m/%Y %H:%M:%S"),epsub$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# plot (1,2) Voltage Vs datetime
plot(strptime(paste(epsub$Date, epsub$Time), "%d/%m/%Y %H:%M:%S"),epsub$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

## plot (2,1) - Energy sub metering Vs datetime
plot(strptime(paste(epsub$Date, epsub$Time), "%d/%m/%Y %H:%M:%S"),epsub$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
with(epsub, points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1, type = "l"))
with(epsub, points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, type = "l", col = "red"))
with(epsub, points(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

# plot (2,2) - Global Reactive Power Vs datetime
plot(strptime(paste(epsub$Date, epsub$Time), "%d/%m/%Y %H:%M:%S"),epsub$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

## close the png device
dev.off() 
