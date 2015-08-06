fName <- "household_power_consumption.txt"
dfPowConsFull <- read.table(fName, header = TRUE, sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric", "numeric"), nrows = 2075259)
dfPowCons <- subset(dfPowConsFull, Date == "1/2/2007" | Date == "2/2/2007")
remove(dfPowConsFull)
dates<-dfPowCons$Date
nDates <- NULL
for (i in dates) {
    d<-as.Date(i,"%d/%m/%Y")
    nDates <- append(nDates, d)
}
dfPowCons$Date <- nDates
dfPowCons <- dfPowCons[order(dfPowCons$Date,dfPowCons$Time),]

png("plot3.png",width=480,height=480)
with(dfPowCons, plot(Sub_metering_1,type = "l", ylab = "Energy sub metering", xaxt = "n", xlab = "", col = "black"))
with(dfPowCons, points(Sub_metering_2,type = "l", ylab = "Energy sub metering", xaxt = "n", xlab = "", col = "red"))
with(dfPowCons, points(Sub_metering_3,type = "l", ylab = "Energy sub metering", xaxt = "n", xlab = "", col = "blue"))
axis(side=1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))
legend("topright", pch = "_", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
remove(dfPowCons)

