hpc <- read.csv("./household_power_consumption.txt", sep = ";", header = TRUE)

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
df <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]   # subset from data
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$DateTime <- strptime(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")
png(filename = "plot2.png")
plot(x = df$DateTime, y = df$Global_active_power, type= "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
