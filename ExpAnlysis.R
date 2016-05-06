# This R script is created for coursera Exploratory analysis - week 1 course project
# The working directory of R is set to C:\NelsonRepo\Technical\DataScience\ExploratoryAnalysis\exdata-data-household_power_consumption.

#load the data from file into dataframe(R Object)

Dataload <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

#Extract dates 16/12/2006 and 2/5/2010

Dataload <- Dataload[Dataload$Date %in% c("1/2/2007","2/2/2007"),]

#Convert to R object date and Time

TmpDtTime <- strptime(paste(Dataload$Date,Dataload$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

# Add the new column TmpDtTime

FinalDataload <- cbind(TmpDtTime,Dataload)

# Change the new column name "TmpDtTime" to "DateTime". 
# The output is ready to plot the graph.

names(FinalDataload)[1] <- "DateTime"

#Plot Graphs

# Plot1 

png(filename="Plot1.png",width=480, height=480, units='px')
hist(FinalDataload$Global_active_power,col="red",main=paste("Global Active Power"),xlab="Global Active Power(Kilowatts)", ylab="Frequency")
dev.off()


# Plot2

png(filename="Plot2.png",width=480, height=480, units='px')
plot(FinalDataload$DateTime,FinalDataload$Global_active_power,type="l",ylab="Global Active Power(Kilowatts)", xlab="Week Day")
dev.off()

# Plot3

png(filename="Plot3.png",width=480, height=480, units='px')
plot(FinalDataload$DateTime,FinalDataload$Sub_metering_1,type="l",col="black",ylab="Energy Sub metering", xlab="Week Day")
lines(FinalDataload$DateTime,FinalDataload$Sub_metering_2,type="l",col="red")
lines(FinalDataload$DateTime,FinalDataload$Sub_metering_3,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")
dev.off()


# Plot4

png(filename="Plot4.png",width=480, height=480, units='px')
par(mfrow=c(2,2))
plot(FinalDataload$DateTime,FinalDataload$Global_active_power,type="l",ylab="Global Active Power(Kilowatts)", xlab="")
plot(FinalDataload$DateTime,FinalDataload$Voltage,type="l",ylab="Voltage)", xlab="DateTime")

plot(FinalDataload$DateTime,FinalDataload$Sub_metering_1,type="l",col="black",ylab="Energy Sub metering", xlab="")
lines(FinalDataload$DateTime,FinalDataload$Sub_metering_2,type="l",col="red")
lines(FinalDataload$DateTime,FinalDataload$Sub_metering_3,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")

plot(FinalDataload$DateTime,FinalDataload$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="DateTime")
dev.off()



