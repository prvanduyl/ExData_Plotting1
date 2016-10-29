## Exploratory Data Analysis Assignment week 1
## Plot 2

## Set the time language to English to get the right axis values
curr_locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")

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

## Define 1 DateTime column out of the 2 seperate columns
dataUsed$DateTime <- as.POSIXct(strptime(paste(dataUsed$Date,dataUsed$Time),
                                         "%d/%m/%Y %H:%M:%S"))

## Generate a png file
plotNbr <- 2
plotName <- paste("plot",plotNbr,".png",sep="")
png(filename = plotName,
    width = 480, height = 480, units = "px", bg = "transparent")

## Define the plot
plot(dataUsed$DateTime,dataUsed$Global_active_power, type = "l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

## Close the png file
dev.off()

## Set the time language back to original value
Sys.setlocale("LC_TIME",curr_locale)
