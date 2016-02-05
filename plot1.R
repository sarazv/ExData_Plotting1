hpc <- read.csv("./household_power_consumption.txt", sep = ";", header = TRUE) # read file

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
df <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]   # subset from data
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
png(filename = "plot1.png")
hist(df$Global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
