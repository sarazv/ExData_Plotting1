hpc <- read.csv("./household_power_consumption.txt", sep = ";", header = TRUE) # read the data from the file

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
df <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]   # subset the desired dates from the data
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$DateTime <- strptime(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S") # with this command we paste the date and the time columns in one just column called DateTime
png(filename = "plot2.png")
plot(x = df$DateTime, y = df$Global_active_power, type= "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
