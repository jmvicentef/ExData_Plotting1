### EXPLORATORY DATA ANALYSIS
## Plot 1

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

# formula for making histogram in screen device

hist(newdata$Global_active_power, col = "red", main = "Global active power", xlab = "Global active power (kilowats)", ylab = "Frequency")

# and we save it as a png file and set width and height (even when values are default)

dev.copy(png, file = "plot1.png", width = 480, height = 480)

# and we close device

dev.off()
