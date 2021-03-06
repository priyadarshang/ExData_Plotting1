
library(data.table)

setwd("F:\\Learning_Resources\\Online_Courses\\Exploratory_Data_Analysis\\Week_1\\course_project_1")

# Setting the column type before reading the file
colClasses<- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", quote = "", colClasses = colClasses)

#Subset the data to choose only the dates of interest
pData <- subset(data, Date=='1/2/2007'| Date=='2/2/2007')

#Convert the date into Date class format
pData$Date <- as.Date(pData$Date, format = '%d/%m/%Y')

# Combining the date and time and converting them into proper format
pData$DateTime <- paste(pData$Date, pData$Time, sep=" ")
pData$DateTime <- strptime(pData$DateTime, format = "%Y-%m-%d %H:%M:%S", tz = "GMT")


x<- pData$DateTime
y1<- pData$Sub_metering_1
y2<- pData$Sub_metering_2
y3<- pData$Sub_metering_3

# Plot the lineplot with appropriate annotations
plot(x, y1, type = "n", ylab = "Energy sub metering",xlab = "")
lines(x, y1, col = "black")
lines(x, y2, col = "red")
lines(x, y3, col = "blue")

legend("topright",lty = 1,  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
