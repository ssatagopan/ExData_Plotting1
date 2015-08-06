fName <- "household_power_consumption.txt"
dfPowConsFull <- read.table(fName, header = TRUE, sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric", "numeric"), nrows = 2075259)
dfPowCons <- subset(dfPowConsFull, Date == "1/2/2007" | Date == "2/2/2007")
remove(dfPowConsFull)
png("plot1.png",width=480,height=480)
hist(dfPowCons$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
remove(dfPowCons)