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


with(specdata, plot(Sub_metering_1 ~ DateTime, type = "l", xlab="", ylab="Energy Sub Metering" ))

lines(specdata$Sub_metering_2 ~ specdata$DateTime, col="red")
lines(specdata$Sub_metering_3 ~ specdata$DateTime, col="blue")
legend("topright", lty=1, lwd=3, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,'plot3.png')

dev.off()