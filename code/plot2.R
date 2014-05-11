data <- read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')
png(file="plot2.png", width=480, height=480, units = "px")
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()