hpc <- read.csv("./household_power_consumption.txt", sep = ";", header = TRUE)

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
df <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]   # subset the desired dates from the data

# following variables need to be defined as a numeric
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))


df$DateTime <- strptime(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png") # open the connection to the png device
with(df, plot(DateTime, Sub_metering_1, type = "n", xlab= "", ylab = "Energy sub metering"))
lines(df$DateTime, df$Sub_metering_3, lty = 1, col = "blue")
lines(df$DateTime, df$Sub_metering_2, lty = 1, col = "red")
lines(df$DateTime, df$Sub_metering_1, lty = 1)
legend("topright", lty= 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"))
dev.off()
