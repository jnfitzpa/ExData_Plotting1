# Importing the dataset
dataset = read.csv('household_power_consumption.txt',sep=";",na.strings = "?")
dataset = dataset[66637:69517,]
dataset$Date = as.Date(dataset$Date,format="%d/%m/%Y")
dataset$WkDay = substring(weekdays(dataset$Date),1,3)

hist(dataset$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',main = 'Global Active Power')
dev.copy(png,file="plot1.png")
dev.off()
