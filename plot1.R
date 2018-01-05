#read in data- process will be identical in all 4 files
data<-read.table("household_power_consumption 2.txt",header = TRUE, sep=";",stringsAsFactors = FALSE)

#filters to the correct dates first, then applies correct formatting
data<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"),]

#combines dates and times in to one string, converts, then adds to the dataset
datetime<-paste(data$Date,data$Time)
time<-strptime(datetime, "%d/%m/%Y %H:%M:%S")
data$datetime<-time

png(filename="plot1.png",height=480, width=480)

hist(as.numeric(data$Global_active_power), col="Red", main="Global Active Power",
     ylim=c(0,1200),xlab=("Global Active Power (kilowatts)"))
axis(side=2,at=seq(0,1200,200),labels = TRUE)

dev.off()
