# only read in data from 2007-02-01 and 2007-02-02
data <- read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')
# open 480x480 pixel png file called plot1.png 
png(file="plot1.png", width=480, height=480, units = "px")
# create histogram of global active power in red with appropriate axis and title
hist(data$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()