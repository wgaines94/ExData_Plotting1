#read in data
data<-read.table("household_power_consumption 2.txt",header = TRUE, sep=";",stringsAsFactors = FALSE)

#filter to relevant dates first, then do formatting
data<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]
datetime<-paste(data$Date,data$Time)
time<-strptime(datetime, "%d/%m/%Y %H:%M:%S")
data$datetime<-time

png(filename="plot4.png",height=480, width=480)

#set global parameters for creating four charts
par(mfrow=c(2,2),mar=c(2,2,1,1))

#create first chart. Identical to Plot1
plot(data$datetime,as.numeric(data$Global_active_power),type = "l",
     xlab="",ylab="Global Active Power (kilowatts)")

#create second chart. Same as Plot2 but with a label
plot(data$datetime,as.numeric(data$Voltage),type = "l",
     ylab="Voltage",xlab="datetime")

#third chart- identical to plot3
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

#final plot- similar to second
plot(data$datetime,as.numeric(data$Global_reactive_power),type = "l",
     ylab="Global Reactive Power", xlab="datetime")

dev.off()
