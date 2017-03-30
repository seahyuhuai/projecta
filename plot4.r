document <- "household_power_consumption.txt"

specdata <- read.table(document, header = F, sep = ";", skip = 1, colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = "?")
cnames <- readLines(document, 1)
cnames <- strsplit(cnames, ";", fixed = TRUE)
names(specdata) <- cnames[[1]]
specdata <- specdata[specdata$Date %in% c("1/2/2007", "2/2/2007"), 
                     ]
specdata$Date_Time <- paste(specdata$Date, specdata$Time)
specdata$Date_Time <- strptime(specdata$Date_Time, "%d/%m/%Y %H:%M:%S")

specdata$Date_Time <- as.POSIXct(specdata$Date_Time)

par(mfrow = c(2,2))

plot(specdata$Global_active_power ~ specdata$Date_Time, type="l", xlab = " ", ylab="Global Active Power")
plot(specdata$Voltage ~ specdata$Date_Time, type="l", ylab = "Voltage", xlab = "datetime")


with(specdata, plot(Sub_metering_1 ~ Date_Time, type = "l", xlab=" ", ylab="Energy sub metering" ))

lines(specdata$Sub_metering_2 ~ specdata$Date_Time, col="red")
lines(specdata$Sub_metering_3 ~ specdata$Date_Time, col="blue")
legend("topright", lty=1, lwd=3, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.55)

plot(specdata$Global_reactive_power ~ specdata$Date_Time, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,'plot4.png')

dev.off()