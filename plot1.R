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
                       
#hist
hist(fpwcdf$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", xlim = c(0, 6), col = "red", axes = FALSE)
axis(1, at=seq(0, 6, by=2), labels=seq(0, 6, by=2))
axis(2, at=seq(0, 1200, by=200), labels=seq(0, 1200, by=200))

#copy to pdf file
dev.copy2pdf(file = "plot1.pdf")
