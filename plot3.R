## Note: you will need to have "sourceFile" in your working directory
sourceFile <- "household_power_consumption.txt"
globalPowerData <- read.table(sourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetGraph <- data[globalPowerData$Date %in% c("1/2/2007","2/2/2007") ,]

dateTime <- strptime(paste(subSetGraph$Date, subSetGraph$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetGraph$Global_active_power)
subMetering1 <- as.numeric(subSetGraph$Sub_metering_1)
subMetering2 <- as.numeric(subSetGraph$Sub_metering_2)
subMetering3 <- as.numeric(subSetGraph$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()