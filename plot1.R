## Note: you will need to have "sourceFile" in your working directory
sourceFile <- "household_power_consumption.txt"
globalPowerData <- read.table(sourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetGraph <- data[globalPowerData$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subSetGraph$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()