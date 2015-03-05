#Read Electric Power Consumption data
elecCons <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.string="?", stringsAsFactors = FALSE, quote = '\"', check.names = FALSE)
elecCons$Date <- as.Date(elecCons$Date, format="%d/%m/%Y")

#Subseting data (Date between 2007-02-01 and 2007-02-02)
elecCons <- elecCons[elecCons$Date >= "2007-02-01" & elecCons$Date <= "2007-02-02", ]

#Create Time and Date Variables using POSIXlt
elecCons$DateTime <- as.POSIXlt(paste(elecCons$Date, elecCons$Time))

#Create Plot 4
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(elecCons, {
    #Topleft Plot
    plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
    #Topright Plot
    plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
    #Bottomleft Plot
    plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
    lines(DateTime, Sub_metering_1, col = "black")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1 ,cex = 0.75, bty = "n")
    #Bottomright Plot
    plot(DateTime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
})

#Export to PNG
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()