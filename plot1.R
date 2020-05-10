# Plot 1
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
# Calling Graphics Device "png" with requisite width and height:
  png(file = "plot1.png", width = 480, height = 480)
# Plotting of Histogram with proper title and axis labeling:  
  hist(powerData$Global_active_power, col = "red", 
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# Calling off the Graphics Device:   
  dev.off()