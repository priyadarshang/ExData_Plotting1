
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

# Plot the histogram with appropriate annotations
x<- pData$Global_active_power
hist(x, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

