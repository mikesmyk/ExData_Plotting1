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

# create plot
with(data, hist(Global_active_power, breaks=15, col='red', 
                main='Global Active Power',
                xlab='Global Active Power (kilowatts)',
                ylab='Frequency'
    )
)

# save plot
dev.copy(png, file='plot1.png', width=480, height=480)
dev.off()
