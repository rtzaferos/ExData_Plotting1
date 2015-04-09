
household_power_consumption <- read.csv("household_power_consumption.txt",sep=";", stringsAsFactors=FALSE ,na.strings="?")

hpc <- subset(household_power_consumption,Date=="1/2/2007" | Date== "2/2/2007")

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc$Datetime <- as.POSIXct(datetime)
Sys.setlocale("LC_TIME", "English")





png(filename = "plot4.png",width = 480, height = 480,units = "px",bg = "transparent")
par(mfrow = c(2, 2))

plot(hpc$Global_active_power~ hpc$Datetime,type = "l",ylab="Global Active Power",xlab="")
plot(hpc$Voltage~ hpc$Datetime,type = "l",ylab = "Voltage",xlab="datetime")
plot(hpc$Sub_metering_1~hpc$Datetime, type="l",xlab="", ylab="Energy sub metering")
lines(hpc$Sub_metering_2~hpc$Datetime , col="red")
lines(hpc$Sub_metering_3~hpc$Datetime, col="blue")
legend("topright",col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,bty = "n")
plot(hpc$Global_reactive_power~ hpc$Datetime,type = "l",
     ylab="Global_reactive_power",xlab="datetime")
dev.off()



