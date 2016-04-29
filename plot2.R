library("data.table")
library("dplyr")

## Source file has been downloaded and unzipped into "data" folder in current working directory.

## load the source file into R and subset for the required dates.
epsource <- fread("data/household_power_consumption.txt",na.strings = "?")
epsub <- filter(epsource, grep("^[1,2]/2/2007", Date))

## Create plot 2 - Global Active Power Vs datetime
plot(strptime(paste(epsub$Date, epsub$Time), "%d/%m/%Y %H:%M:%S"),epsub$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

## Copy the plot to a PNG file.
dev.copy(png, file = "plot2.png")
dev.off() 
