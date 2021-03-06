# Importing the dataset
dataset = read.csv('household_power_consumption.txt',sep=";",na.strings = "?")
dataset = dataset[66637:69517,]
dataset$Date = as.Date(dataset$Date,format="%d/%m/%Y")
dataset$WkDay = substring(weekdays(dataset$Date),1,3)
dataset$DtTm = as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2))
with(dataset,{
    plot(Global_active_power ~ DtTm,type = "l",xlab = "", ylab='Global Active Power')
    plot(Voltage ~ DtTm,type = "l",xlab = "datetime", ylab='Voltage')
    plot(Sub_metering_1 ~ DtTm,type = "l",xlab = "", ylab='Energy sub metering')
    lines(Sub_metering_2 ~ DtTm,col="red")
    lines(Sub_metering_3 ~ DtTm,col="blue")
    legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1))
    plot(Global_reactive_power ~ DtTm,type = "l",xlab = "datetime", ylab='Global_reactive_power')
})

dev.copy(png,file="plot4.png")
dev.off()
