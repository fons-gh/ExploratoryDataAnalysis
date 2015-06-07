## Read complete dataset
data_complete <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_complete$Date <- as.Date(data_complete$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_complete, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_complete)

## Converting date times
datetimes <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetimes)

## Create Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving plot 1 to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
