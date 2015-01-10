
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


y<- pData$Global_active_power
x<- pData$DateTime

# Plot the lineplot with appropriate annotations
plot(x, y, type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
lines( x, y, col = "black")
