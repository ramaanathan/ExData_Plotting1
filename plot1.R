# read in the data file - ensure to specify nrows and colClasses for better memory usage and faster reading of data
energyUsage = read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=2075260,colClasses=c("character","character",rep("numeric",7)),na.strings="?")
#convert 1st column to date format
energyUsage[,1] = as.Date(energyUsage[,1],format="%d/%m/%Y")
#create a subset of the dataset where the date is one of 2Days - 2007-02-01 or 2007-02-02
energyUsage2D <- subset(energyUsage,energyUsage$Date==as.Date("2007-02-01")|energyUsage$Date==as.Date("2007-02-02"))
#first create a histogram plot og global_active_power on the screen device
with(energyUsage2D,hist(Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)"))

#copy into png graphic device
dev.copy(png,file="plot1.png",width=480,height=480)
#turn off device for the file to be actually created
dev.off()