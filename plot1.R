# call data
household_power_consumption <- read.csv("~/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")
View(household_power_consumption)

#subset data to key rows
keydates <- subset(household_power_consumption, Date=="2/1/2007" | Date== "2/2/2007")
glimpse(keydates)

#change to numeric data

global_active_power <- as.numeric(keydates$Global_active_power)

#create histogram

png(filename = "~/Downloads/plot1.png", width = 480, height = 480)

hist(global_active_power, ylab="Frequency", xlab="Global Active Power (kilowatts)", main= "Global Active Power", col="red")

dev.off()
