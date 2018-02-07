rm(list=ls())

# Load data
read.data <- function(){
  # only data from the dates 2007-02-01 and 2007-02-02 is used. Checked in Editor which lines needed to speed up data loading.
  first.line <- 66637
  last.line <- 69518
  header <- read.table("household_power_consumption.txt", sep=";", header=FALSE, nrows=1)
  data <- read.table("household_power_consumption.txt", sep=";", header=FALSE, skip=first.line, nrows=last.line-first.line-1,na.strings="?")
  names(data) <- unlist(header)
  data
}
data <- read.data()

data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# create plot
png(file='plot3.png', width=480, height=480)
with(data, {
  plot(datetime, Sub_metering_1, type='l', col='black',
                ylab='Global Active Power (kilowatts)', xlab='')
  lines(datetime, Sub_metering_2, col='red')
  lines(datetime, Sub_metering_3, col='blue')
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
}
)

# save plot
dev.off()

