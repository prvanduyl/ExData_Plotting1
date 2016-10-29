## Exploratory Data Analysis Assignment week 1
## Plot 1

## Download Household Power Consumption data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./household_power_consumption.zip", mode = 'wb')
unzip("household_power_consumption.zip")

## Load the needed packages
library(data.table)
library(datasets)

## Load the data 
colClasses <- c("character", "character", "numeric", "numeric", 
                "numeric", "numeric", "numeric", "numeric", "numeric")
data <- data.table(read.table("household_power_consumption.txt", header = TRUE, 
                              sep = ";", dec = ".", na.strings = "?", 
                              colClasses = colClasses))

## Filter the full set based on the days to analyse
datesUsed <- c("1/2/2007","2/2/2007")
dataUsed <- data[data$Date %in% datesUsed,]

## Generate a png file
plotNbr <- 1
plotName <- paste("plot",plotNbr,".png",sep="")
png(filename = plotName,
    width = 480, height = 480, units = "px", bg = "transparent")

## Define the plot
hist(dataUsed$Global_active_power, 
     col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

## Close the png file
dev.off()

