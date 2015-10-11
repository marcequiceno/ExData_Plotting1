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

#Plot 2
png("plot2.png", width=480, height= 480)
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, 
     ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()