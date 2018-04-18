# set the working directory
setwd("~/MyR/Coursera/EDA/WEEK1")

# set the local to system to english
Sys.setlocale("LC_TIME", "English")

# read all data from file household_power_consumption.txt
df_all <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";")

# subset the data from 2007-02-01 to 2007-02-02
df <- subset(df_all, Date == "1/2/2007" | Date == "2/2/2007")
head(df)

# set the time series to, combine date with time
x <- paste(as.character(df$Date), as.character(df$Time))
date_time <- strptime(x, "%d/%m/%Y %H:%M:%S")

# change the type from Factor to numeric
df$Global_active_power<-as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power<-as.numeric(as.character(df$Global_reactive_power))
df$Voltage<-as.numeric(as.character(df$Voltage))
df$Sub_metering_1<-as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2<-as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3<-as.numeric(as.character(df$Sub_metering_3))

# set the plotting area to 2x2
par(mfrow=c(2,2))

# plot the time serie vs Global active power
plot(date_time, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# plot the time serie vs Voltage
plot(date_time, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot the time serie vs Sub metering x
plot(date_time, df$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, df$Sub_metering_2, col = "red")
lines(date_time, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

# plot the time serie vs Global active power
plot(date_time, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# save the plot as plt4.png
dev.copy(png,'plot4.png', width=480,height=480)
dev.off()
