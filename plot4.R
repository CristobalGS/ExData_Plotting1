library(dplyr)
setwd("C:/Users/cfgal/OneDrive/Documents/Coursera/Data Science Specialization/Exploratory Data Analysis/Assignment 1")
hpc <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
hpc <- mutate(hpc, Date = as.Date(Date, "%d/%m/%Y"))
hpc <- mutate(hpc, Global_active_power = as.numeric(Global_active_power))
hpc <- mutate(hpc, weekday = weekdays(Date))
time <- paste(hpc$Date, hpc$Time)
time <- strptime(time, "%Y-%m-%d %H:%M:%S")
hpc <- cbind(hpc, time)

png(width = 480, height = 480, file = "plot4.png")

par(mfrow = c(2, 2))

plot(hpc$time, hpc$Global_active_power, pch = NA, ylab = "Global Active Power", xlab = "")
lines(hpc$time, hpc$Global_active_power)

plot(hpc$time, hpc$Voltage, pch = NA, ylab = "Voltage", xlab = "datetime")
lines(hpc$time, hpc$Voltage)

plot(hpc$time, hpc$Sub_metering_1, pch = NA, ylab = "Energy sub metering", xlab = "")
lines(hpc$time, hpc$Sub_metering_1)
lines(hpc$time, hpc$Sub_metering_2, col = "red")
lines(hpc$time, hpc$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .8)

plot(hpc$time, hpc$Global_reactive_power, pch = NA, ylab = "Global_reactive_power", xlab = "datetime")
lines(hpc$time, hpc$Global_reactive_power)

dev.off()





