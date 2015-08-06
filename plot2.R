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

png("plot2.png",width=480,height=480)
plot(dfPowCons$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xaxt = "n", xlab = "")
axis(side=1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))
dev.off()
remove(dfPowCons)

