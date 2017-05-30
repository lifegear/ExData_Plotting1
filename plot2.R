library(dplyr)

#download and unzip
filepath <- "./ExData_Plotting1.zip"
pow_consump_zip <- download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = filepath)
unzip(filepath)

#load table
pow_consump_df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#filter, data from the dates 2007-02-01 and 2007-02-02
powc_date <- as.POSIXct(strptime(pow_consump_df$Date, "%d/%m/%Y"))
fdated <- powc_date >= as.POSIXct(strptime("2007-02-01", "%Y-%m-%d")) & powc_date <= as.POSIXct(strptime("2007-02-02", "%Y-%m-%d"))
fpwcdf <- pow_consump_df[fdate,] 

#generate Date_Time feature
fpwcdf$Date_Time <- paste(fpwcdf$Date, fpwcdf$Time)
fpwcdf$Date_Time <- strptime(fpwcdf$Date_Time, "%d/%m/%Y %H:%M:%S")

#plot
plot(x = fpwcdf$Date_Time, y = fpwcdf$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

#copy to pdf file
dev.copy2pdf(file = "plot2.pdf")
