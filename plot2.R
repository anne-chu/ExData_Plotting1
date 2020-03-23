#Loading the data
data <- read.table(file = "Data/household_power_consumption.txt", header=T, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#subset data set
plotdates <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

##Combine Date and Time column and convert to date+time format
SetTime <-strptime(paste(plotdates$Date, plotdates$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
plotdates <- cbind(SetTime, plotdates)

#construct plot2.png
png("plot2.png", width = 480, height = 480)
plot(plotdates$SetTime, plotdates$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
