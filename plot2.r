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

plot(specdata$Global_active_power ~ specdata$Date_Time,  xlab= "", ylab = "Global Active power (kilowatts)", type ="l" )

dev.copy(png,'plot2.png')

dev.off()