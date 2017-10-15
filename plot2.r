# Importing the dataset
dataset = read.csv('household_power_consumption.txt',sep=";",na.strings = "?")
dataset = dataset[66637:69517,]
dataset$Date = as.Date(dataset$Date,format="%d/%m/%Y")
dataset$WkDay = substring(weekdays(dataset$Date),1,3)
dataset$DtTm = as.POSIXct(paste(dataset$Date, dataset$Time), format="%Y-%m-%d %H:%M:%S")

with(dataset,plot(Global_active_power ~ DtTm,type = "l",xlab = "", ylab='Global Active Power (kilowatts)'))
dev.copy(png,file="plot2.png")
dev.off()
