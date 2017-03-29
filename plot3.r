with(specdata, plot(Sub_metering_1 ~ DateTime, type = "l", xlab="", ylab="Energy Sub Metering" ))

lines(specdata$Sub_metering_2 ~ specdata$DateTime, col="red")
lines(specdata$Sub_metering_3 ~ specdata$DateTime, col="blue")
legend("topright", lty=1, lwd=3, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
