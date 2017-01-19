### EXPLORATORY DATA ANALYSIS
## Plot 4

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# download data and unzip it

download.file(fileUrl, destfile = "./data.zip", method = "curl")
unzip("data.zip", exdir = ".")

# read in data

powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# strptime() and as.Date() functions. Default is Year-Month-Day.
# strptime(powerdata[1,1], format = "%d/%m/%Y")

# subsetting with dates that we're gonna study and rbinding the 2 subsets

subset1 <- subset(powerdata, Date == "1/2/2007")
subset2 <- subset(powerdata, Date == "2/2/2007")
newdata <- rbind(subset1, subset2)

# creating the 2 x 2 space for the plots

par(mfrow = c(2,2))

# formula for plot number 1

plot(newdata$Time, newdata$Global_active_power, type = "c", xaxt = "n", ylab = "Global Active Power (kilowatts)")
axis(side=1,at=c(0,720,1440),labels=c("Thu","Fri","Sat"))

# formula for plot number 2

plot(newdata$Time, newdata$Voltage, type = "c", xaxt = "n", ylab = "Voltage", xlab = "datetime")
axis(side=1,at=c(0,720,1440),labels=c("Thu","Fri","Sat"))

# formula for plot number 3

plot(newdata$Time, newdata$Sub_metering_1, type = "c", xaxt = "n", ylab = "Energy sub metering")
lines(newdata$Time, newdata$Sub_metering_2, col = "red")
lines(newdata$Time, newdata$Sub_metering_3, col = "blue")
legend("topright", pch =  "----", col = c("black", "blue", "red"), bty = "n", y.intersp = 0.4, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side=1,at=c(0,720,1440),labels=c("Thu","Fri","Sat"))

# formula for plot number 4

plot(newdata$Time, newdata$Global_reactive_power, type = "c", xaxt = "n", ylab = "Global reactive power", xlab = "datetime")
axis(side=1,at=c(0,720,1440),labels=c("Thu","Fri","Sat"))

# and we save it as a png file and set width and height (even when values are default)

dev.copy(png, file = "plot4.png", width = 480, height = 480)

# and we close device

dev.off()
