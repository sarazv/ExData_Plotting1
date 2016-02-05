hpc <- read.csv("./household_power_consumption.txt", sep = ";", header = TRUE)

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
df <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]   # subset desired dates from the data

# following variables need to be defined as a numeric
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_3))
df$Voltage <- as.numeric(as.character(df$Voltage))

df$DateTime <- strptime(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png") # open connection to graphics device

par(mfrow = c(2,2)) # we divide the canvas in 2 rows and 2 columns

plot(x = df$DateTime, y = df$Global_active_power, type= "l", ylab = "Global Active Power (kilowatts)", xlab = "") # plot first graphic
plot(x = df$DateTime, y = df$Voltage, type= "l", ylab = "Voltage", xlab = "datetime") # plot second graphics

with(df, plot(DateTime, Sub_metering_1, type = "n", xlab= "", ylab = "Energy sub metering")) # plot third graphics
lines(df$DateTime, df$Sub_metering_3, lty = 1, col = "blue")
lines(df$DateTime, df$Sub_metering_2, lty = 1, col = "red")
lines(df$DateTime, df$Sub_metering_1, lty = 1)
legend("topright", lty= 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"))

plot(x = df$DateTime, y = df$Global_reactive_power, type= "l", ylab = "Global Reactive Power", xlab = "datetime") # plot fourth graphic
dev.off()
