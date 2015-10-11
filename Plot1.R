#Exploratory Data Analysis
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

#Plot 1
png("plot1.png", width=480, height= 480)
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "orangered", cex.axis = 0.6)
dev.off()