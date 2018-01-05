data<-read.table("household_power_consumption 2.txt",header = TRUE, sep=";",stringsAsFactors = FALSE)

data<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
datetime<-paste(data$Date,data$Time)
time<-strptime(datetime, "%d/%m/%Y %H:%M:%S")
data$datetime<-time

png(filename="plot2.png",height=480, width=480)

plot(data$datetime,as.numeric(data$Global_active_power),type = "l",
     xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
