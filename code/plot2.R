# only read in data from 2007-02-01 and 2007-02-02
data <- read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')
# open 480x480 pixel png file called plot2.png 
png(file="plot2.png", width=480, height=480, units = "px")
# create new column of DateTime objects
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
# create line plot of Global Active Power with appropriate labels
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()