#Loading the data
data <- read.table(file = "Data/household_power_consumption.txt", header=T, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#subset data set
plotdates <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

##Combine Date and Time column and convert to date+time format
SetTime <-strptime(paste(plotdates$Date, plotdates$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
View(SetTime)
plotdates <- cbind(SetTime, plotdates)
View(plotdates)

#construct plot1.png
dev.copy(png, file="plot1.png", width=480, height=480)
hist(plotdates$Global_active_power, ylim=c(0, 1250), xlab="Global Active Power (kilowatts", col="red", main="Global Active Power")
dev.off()