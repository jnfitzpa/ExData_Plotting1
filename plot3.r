# Importing the dataset
dataset = read.csv('household_power_consumption.txt',sep=";",na.strings = "?")
dataset = dataset[66637:69517,]
dataset$Date = as.Date(dataset$Date,format="%d/%m/%Y")
dataset$WkDay = substring(weekdays(dataset$Date),1,3)
dataset$DtTm = as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")

with(dataset,{
    plot(Sub_metering_1 ~ DtTm,type = "l",xlab = "", ylab='Energy sub metering')
    lines(Sub_metering_2 ~ DtTm,col="red")
    lines(Sub_metering_3 ~ DtTm,col="blue")
    legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1))
})


dev.copy(png,file="plot3.png")
dev.off()
