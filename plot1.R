
# set the working directory
setwd("~/MyR/Coursera/EDA/WEEK1")

# set the local to system to english
Sys.setlocale("LC_TIME", "English")

# read all data from file household_power_consumption.txt
df_all <- read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt"), header=TRUE, sep=";")

#df_all <-read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# subset the data from 2007-02-01 to 2007-02-02
df <- subset(df_all, Date == "1/2/2007" | Date == "2/2/2007")

# set the Global_active_power as numeric
df$Global_active_power<-as.numeric(as.character(df$Global_active_power))

# plot the histogram of the Global_active_power, with red color, xlabel and title  
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# save the plot as plot1.png
dev.copy(png,'plot1.png', width=480,height=480)
dev.off()
