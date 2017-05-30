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
plot(x = fpwcdf$Date_Time, y = fpwcdf$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
lines(x = fpwcdf$Date_Time, y = fpwcdf$Sub_metering_1)
lines(x = fpwcdf$Date_Time, y = fpwcdf$Sub_metering_2, col = "red")
lines(x = fpwcdf$Date_Time, y = fpwcdf$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))

#copy to pdf file
dev.copy2pdf(file = "plot3.pdf")
