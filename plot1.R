library("data.table")
library("dplyr")

## Source file has been downloaded and unzipped into "data" folder in current working directory.

## load the source file into R and subset for the required dates.
epsource <- fread("data/household_power_consumption.txt",na.strings = "?")
epsub <- filter(epsource, grep("^[1,2]/2/2007", Date))

## Create plot 1 - Histogram of Global Active Power.
hist(epsub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red" )

## Copy the plot to a PNG file.
dev.copy(png, file = "plot1.png")
dev.off() 
