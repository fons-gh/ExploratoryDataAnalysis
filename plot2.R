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

## Create Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving plot 2 to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()