# only read in data from 2007-02-01 and 2007-02-02
data <- read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')
# open 480x480 pixel png file called plot3.png 
png(file="plot3.png", width=480, height=480, units = "px")
# create new column of DateTime objects
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
# create initial plot of Sub metering 1 with correct labels
plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
# add Sub metering 2 and 3 to same graph with different line colors
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
# create legend in upper right hand corner
legend("topright",col = c("black","red","blue"), lty = 1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()