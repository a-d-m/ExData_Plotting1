## Note: you will need to have "sourceFile" in your working directory
sourceFile <- "household_power_consumption.txt"
globalPowerData <- read.table(sourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetGraph <- data[globalPowerData$Date %in% c("1/2/2007","2/2/2007") ,]

dateTime <- strptime(paste(subSetGraph$Date, subSetGraph$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetGraph$Global_active_power)
globalReactivePower <- as.numeric(subSetGraph$Global_reactive_power)

voltage <- as.numeric(subSetGraph$Voltage)
subMetering1 <- as.numeric(subSetGraph$Sub_metering_1)
subMetering2 <- as.numeric(subSetGraph$Sub_metering_2)
subMetering3 <- as.numeric(subSetGraph$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()