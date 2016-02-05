hpc <- read.csv("./household_power_consumption.txt", sep = ";", header = TRUE) # read file

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y") 
df <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]   # subset the desired dates from the data
df$Global_active_power <- as.numeric(as.character(df$Global_active_power)) # at first Global_active_power is defined as a factor, we need to define it as a numeric
png(filename = "plot1.png")
hist(df$Global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
