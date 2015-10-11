#Peer Assessments /Course Project 1
#Dataset: Electric power consumption
#Description: Measurements of electric power consumption in one household with a one-minute 
#sampling rate over a period of almost 4 years. Different electrical quantities and some 
#sub-metering values are available.

#Read data
data <- read.table(unz("exdata-data-household_power_consumption.zip", 
                       "household_power_consumption.txt"), header=T, sep=";", quote="", 
                   strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subset data 
data <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

#Plot 4
png("plot4.png", width=480, height= 480)

par(mfrow=c(2,2))

#(1,1)
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, 
     ylab= "Global Active Power (kilowatts)", xlab="")

#(1,2)
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#(2,1)
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))

#(2,2)
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()