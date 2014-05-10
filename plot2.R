# read in the data file - ensure to specify nrows and colClasses for better memory usage and faster reading of data
energyUsage = read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=2075260,colClasses=c("character","character",rep("numeric",7)),na.strings="?")
#convert 1st column to date format
energyUsage[,1] = as.Date(energyUsage[,1],format="%d/%m/%Y")
#create a subset of the dataset where the date is one of 2Days - 2007-02-01 or 2007-02-02
energyUsage2D <- subset(energyUsage,energyUsage$Date==as.Date("2007-02-01")|energyUsage$Date==as.Date("2007-02-02"))

# We need to plot against time. So, create a column with the date-time information
energyUsage2D$DateTime <- strptime(paste(energyUsage2D$Date,energyUsage2D$Time),format="%Y-%m-%d %H:%M:%S")
#plot using lines
with(energyUsage2D, plot(DateTime,energyUsage2D$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

# write into png
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
