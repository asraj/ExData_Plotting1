## Read data file
hpc <- read.table("household_power_consumption.txt", header=T, sep=";")

## Create data time variable
hpc$Date_Time <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

## convert Date variable
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## Filter for Feb 1 and Feb 2, 2007 data
data <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

## Convert to numeric
data$Global_active_power <-as.numeric(as.character(data$Global_active_power))
data$Voltage <-as.numeric(as.character(data$Voltage))
data$Global_reactive_power <-as.numeric(as.character(data$Global_reactive_power))

## Convert sub meter reading to mumeric
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

par(mfrow=c(2,2))

## Plot 1, 1
plot(data$Date_Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## Plot 1, 2
plot(data$Date_Time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")


## Plot 2,1
plot(data$Date_Time,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Date_Time,data$Sub_metering_2,col="red")
lines(data$Date_Time,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),lty=c(1,1), bty="n", cex=.5)

#Plot 2,2
plot(data$Date_Time,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Copy plot to a PNG file
dev.copy(png, file = "ExData_Plotting1\\plot4.png", width=480, height=480) 
dev.off() ## close the PNG device!