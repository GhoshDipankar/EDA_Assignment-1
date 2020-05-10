# Assignment-1: Exploratory Data Analysis
#
# Plot 3
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Prerequisite: 
# Proper directory is set
# Loading "dplyr" package
  library(dplyr)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Downloading and Unzipping "Electric power consumption" dataset:
# Given URL:
  URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# Downloading and unzipping file:
  download.file(URL, destfile = "data.zip")
  unzip("data.zip")
# Reading of Data into a data frame called "data":
  data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
# Subsetting data for the dates "1/2/2007" and "2/2/2007" into a data frame "powerData"   
  powerData <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
# Removing unwanted data and values:
  rm(data, URL)
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Converting Date variable from factor to Date class:
  powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
# Adding a new POSIXct class called "DateTime" into powerData:
  Date_Time <- paste(powerData$Date, powerData$Time)
  powerData <- mutate(powerData, DateTime = as.POSIXct(Date_Time, format = "%Y-%m-%d %H:%M:%S"))
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Calling Graphics Device "png" with requisite width and height:
  png(file = "plot3.png", width = 480, height = 480)
# Plotting of Energy with DateTime for different sub meters and inclusion of axis labeling and legend:  
  with(powerData, {plot(DateTime, Sub_metering_1, type = "l", col = "black", 
                        xlab = "", ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_2, type = "l", col = "red")
    lines(DateTime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", col = c("black","red","blue"), lty = 1, 
           legend = c("Sub_metring_1","Sub_metring_2","Sub_metring_3"))})
# Calling off the Graphics Device:   
  dev.off()