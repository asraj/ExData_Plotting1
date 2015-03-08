## Read data file
hpc <- read.table("household_power_consumption.txt", header=T, sep=";")

## Create data time variable
hpc$Date_Time <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

## convert Date variable
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## Filter for Feb 1 and Feb 2, 2007 data
data <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

## Convert Global active power to numeric
data$Global_active_power <-as.numeric(as.character(data$Global_active_power))

## Convert sub meter reading to mumeric
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

## Plot lines
plot(data$Date_Time,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Date_Time,data$Sub_metering_2,col="red")
lines(data$Date_Time,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),lty=c(1,1), lwd=c(1,1))

## Copy plot to a PNG file
dev.copy(png, file = "ExData_Plotting1\\plot3.png", width=480, height=480) 
dev.off() ## close the PNG device!