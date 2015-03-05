#Read Electric Power Consumption data
elecCons <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.string="?", stringsAsFactors = FALSE, quote = '\"', check.names = FALSE)
elecCons$Date <- as.Date(elecCons$Date, format="%d/%m/%Y")

#Subseting data (Date between 2007-02-01 and 2007-02-02)
elecCons <- elecCons[elecCons$Date >= "2007-02-01" & elecCons$Date <= "2007-02-02", ]

#Create Time and Date Variables using POSIXlt
elecCons$DateTime <- as.POSIXlt(paste(elecCons$Date, elecCons$Time))

#Create Plot 2
with(elecCons, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (killowatts)", type = "l"))

#Export to PNG
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()