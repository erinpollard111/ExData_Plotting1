# call data
household_power_consumption <- read.csv("~/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")
View(household_power_consumption)

#subset data to key rows
keydates <- subset(household_power_consumption, Date=="2/1/2007" | Date== "2/2/2007")
print(keydates)


#change time to continuous 

datetime <- paste(keydates$Date, keydates$Time)

datetime <- as.POSIXct(datetime, format="%m/%d/%Y %H:%M:%S")

glimpse(datetime)
# plot

glimpse(keydates$Sub_metering_1)
summarize(keydates$Sub_metering_1)
png(filename = "~/Downloads/plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

#plot 1
plot (datetime, global_active_power, type="l", xaxt="n", ylab="Global Active Power (kilowatts)", xlab="")
ticks <- seq(min(datetime), max(datetime+1), by="days")
labels <- format(ticks, "%A") 
axis(1, at=ticks, labels=labels)

#plot 2
plot (datetime, keydates$Voltage, type="l", xaxt="n", ylab="Voltage)", xlab="datetime")
ticks <- seq(min(datetime), max(datetime+1), by="days")
labels <- format(ticks, "%A") 
axis(1, at=ticks, labels=labels)

#plot 3
plot(datetime, keydates$Sub_metering_1, type = "l", xaxt="n", col = "black",  xlab = "", ylab = "Energy sub metering", ylim=c(0,30))
lines(datetime, keydates$Sub_metering_2, col = "red")
lines(datetime, keydates$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), lty = 1)
ticks <- seq(min(datetime), max(datetime+1), by="days")
labels <- format(ticks, "%A") 
axis(1, at=ticks, labels=labels)

#plot 4
plot (datetime, keydates$Global_reactive_power, type="l", xaxt="n", ylab="Global_reactive_power", xlab="datetime")
ticks <- seq(min(datetime), max(datetime+1), by="days")
labels <- format(ticks, "%A") 
axis(1, at=ticks, labels=labels)


dev.off()
