
household_power_consumption <- read.csv("household_power_consumption.txt",sep=";", stringsAsFactors=FALSE ,na.strings="?")

hpc <- subset(household_power_consumption,Date=="1/2/2007" | Date== "2/2/2007")

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc$Datetime <- as.POSIXct(datetime)
Sys.setlocale("LC_TIME", "English")

png(filename = "plot2.png",width = 480, height = 480,units = "px",bg = "transparent")
plot(hpc$Global_active_power~ hpc$Datetime,type = "l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()

