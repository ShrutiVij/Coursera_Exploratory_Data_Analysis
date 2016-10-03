
filenm <- "household_power_consumption.txt"
#fetch Data from file
allData <- read.table(filenm,header = TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
#Extract Data only for Dates 1/2/2007 and 2/2/2007
epcData <- subset(allData,  Date %in% c("1/2/2007","2/2/2007"))

# Merge the Date and Time
weekd <- strptime(paste(epcData$Date,epcData$Time),"%d/%m/%Y %H:%M:%S")

#Plot the Graph
png("plot3.png")
with(epcData,plot(weekd,Sub_metering_1,type="l",ylab = "Energy sub metering" ))
lines(weekd,epcData$Sub_metering_2, type="l",col="red")
lines(weekd,epcData$Sub_metering_3, type="l",col="blue")
legend("topright",col = c("black","red","blue"), lty = c(1,1),lwd = c(2,2), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()