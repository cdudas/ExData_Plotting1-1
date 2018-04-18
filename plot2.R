
# set the working directory
setwd("~/MyR/Coursera/EDA/WEEK1")

# set the local to system to english
Sys.setlocale("LC_TIME", "English")

# read all data from file household_power_consumption.txt
df_all <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";")

# subset the data from 2007-02-01 to 2007-02-02
df <- subset(df_all, Date == "1/2/2007" | Date == "2/2/2007")

# set the time series to, combine date with time
x <- paste(as.character(df$Date), as.character(df$Time))
date_time <- strptime(x, "%d/%m/%Y %H:%M:%S")

# change the type from Factor to numeric
df$Global_active_power<-as.numeric(as.character(df$Global_active_power))

# plot the time serie vs Global active power
plot(date_time, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# save the plot as plot2.png
dev.copy(png,'plot2.png', width=480,height=480)
dev.off()
