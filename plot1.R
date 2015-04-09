
household_power_consumption <- read.csv("household_power_consumption.txt",sep=";", stringsAsFactors=FALSE ,na.strings="?")

hpc <- subset(household_power_consumption,Date=="1/2/2007" | Date== "2/2/2007")



png(filename = "plot1.png",width = 480, height = 480,units = "px",bg = "transparent")
hist(hpc$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power",breaks = 12, ylim = c(0, 1200))
dev.off()
