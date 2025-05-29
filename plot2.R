# call data
household_power_consumption <- read.csv("~/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")
View(household_power_consumption)

#subset data to key rows
keydates <- subset(household_power_consumption, Date=="2/1/2007" | Date== "2/2/2007")
print(keydates)

#change to numeric data

global_active_power <- as.numeric(keydates$Global_active_power)

#change time to continuous 

datetime <- paste(keydates$Date, keydates$Time)

datetime <- as.POSIXct(datetime, format="%m/%d/%Y %H:%M:%S")

glimpse(datetime)
# plot


png(filename = "~/Downloads/plot2.png", width = 480, height = 480)

plot (datetime, global_active_power, type="l", xaxt="n", ylab="Global Active Power (kilowatts)", xlab="")
ticks <- seq(min(datetime), max(datetime+1), by="days")
labels <- format(ticks, "%A") 
axis(1, at=ticks, labels=labels)

dev.off()
