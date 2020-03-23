#Loading the data
data <- read.table(file = "Data/household_power_consumption.txt", header=T, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#subset data set
plotdates <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

##Combine Date and Time column and convert to date+time format
SetTime <-strptime(paste(plotdates$Date, plotdates$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
plotdates <- cbind(SetTime, plotdates)

#construct plot3.png
png("plot3.png", width = 480, height = 480)

with(plotdates, {
    plot(SetTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(SetTime, Sub_metering_2, col="red")
    lines(SetTime, Sub_metering_3, col="blue")
})

legend("topright", lty = 1, lwd=2.5, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     
dev.off()

