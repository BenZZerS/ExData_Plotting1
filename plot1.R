#Read Electric Power Consumption data
elecCons <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.string="?", 
                     stringsAsFactors = FALSE, quote = '\"', check.names = FALSE)
elecCons$Date <- as.Date(elecCons$Date, format="%d/%m/%Y")

#Subseting data (Date between 2007-02-01 and 2007-02-02)
elecCons <- elecCons[elecCons$Date >= "2007-02-01" & elecCons$Date <= "2007-02-02", ]

#Create Plot 1
hist(elecCons$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

#Export to PNG
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()