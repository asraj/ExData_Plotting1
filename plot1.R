## Read data file
hpc <- read.table("household_power_consumption.txt", header=T, sep=";")

## Create data time variable
#hpc$Date_Time <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

## convert Date variable
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## Filter for Feb 1 and Feb 2, 2007 data
data <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

## Convert Global active power to numeric
data$Global_active_power <-as.numeric(as.character(data$Global_active_power))

## Plot Histogram
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")

## Copy plot to a PNG file
dev.copy(png, file = "ExData_Plotting1\\plot1.png", width=480, height=480) 
dev.off() ## close the PNG device!