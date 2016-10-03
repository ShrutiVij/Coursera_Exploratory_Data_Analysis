filenm <- "household_power_consumption.txt"
#fetch Data from file
allData <- read.table(filenm,header = TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
#Extract Data only for Dates 1/2/2007 and 2/2/2007
epcData <- subset(allData,  Date %in% c("1/2/2007","2/2/2007"))
#Convert Global Active power to numeric
gactivp <- na.omit(as.numeric(epcData$Global_active_power))

# Plot the Graph
png("plot1.png")
hist(gactivp,col="red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()

