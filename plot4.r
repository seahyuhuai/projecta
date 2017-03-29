par(mfrow = c(2,2))

plot(specdata$Global_active_power ~ specdata$DateTime, type="l", ylab="Global Active Power")
plot(specdata$Voltage ~ specdata$DateTime, type="l", ylab = "Voltage", xlab = "datetime")


with(specdata, plot(Sub_metering_1 ~ DateTime, type = "l", xlab="", ylab="Energy sub metering" ))

lines(specdata$Sub_metering_2 ~ specdata$DateTime, col="red")
lines(specdata$Sub_metering_3 ~ specdata$DateTime, col="blue")
legend("topright", lty=1, lwd=3, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(specdata$Global_reactive_power ~ specdata$DateTime, type="l", xlab="datetime", ylab="Global_reactive_power")