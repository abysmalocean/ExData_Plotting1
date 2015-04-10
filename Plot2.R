

setwd("F:/Online_Certification/Data_scientist/Data_science/04_Exploratory_Data_Analysis/Project1/ExData_Plotting1")
if(!file.exists("./data")){dir.create("./data")}
## download the file if needed
if(!file.exists("./data/Data.zip")){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url = fileUrl,destfile = "./data/Data.zip",method = "curl")
}
##unzip the file
if(!file.exists("./data/household_power_consumption.txt")){
    unzip(zipfile = "./data/Data.zip",exdir = "./data")
}
 

File_Path <- "./data/"

My_data <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
My_data$Date <- as.Date(My_data$Date, format="%d/%m/%Y")
data <- subset(My_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(My_data)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2 
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()