data<-read.table("household_power_consumption 2.txt",header = TRUE, sep=";",stringsAsFactors = FALSE)

data<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
datetime<-paste(data$Date,data$Time)
time<-strptime(datetime, "%d/%m/%Y %H:%M:%S")
data$datetime<-time

png(filename="plot3.png",height=480, width=480)

plot(data$datetime,as.numeric(data$Sub_metering_1),type = "n",
     xlab="",ylab="Energy Sub Metering")
points(data$datetime,as.numeric(data$Sub_metering_1),type = "l",
       col="black")
points(data$datetime,as.numeric(data$Sub_metering_2),type = "l",
       col="red")
points(data$datetime,as.numeric(data$Sub_metering_3),type = "l",
       col="blue")
legendnames<-c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3")
legendcolors<-c("black","red","blue")
legendlines<-c(1,1,1)
legend("topright",legend=legendnames,col=legendcolors,lty=legendlines)

dev.off()
