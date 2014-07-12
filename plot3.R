plot3 <- function()
{
  # Keep the input file in the working directory and the source file in working directory
  # execute the following to generate the plot
  # source("plot3.R")
  # plot3()
d <- read.table("household_power_consumption.txt", 
                sep=";", 
                header=TRUE
)
as.Date(d$Date, format = "%d/%m/%Y")
dfplot3 <- data.frame(as.Date(d$Date, format = "%d/%m/%Y"),strptime(paste(d$Date,d$Time), format="%d/%m/%Y %H:%M:%S"),d$Sub_metering_1,d$Sub_metering_2,d$Sub_metering_3)
colnames(dfplot3) <- c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")
dfsubplot3 <- data.frame(dfplot3$Date[dfplot3$Date=="2007-02-01" | dfplot3$Date== "2007-02-02"],dfplot3$Time[dfplot3$Date=="2007-02-01" | dfplot3$Date== "2007-02-02"],dfplot3$Sub_metering_1[dfplot3$Date=="2007-02-01" | dfplot3$Date== "2007-02-02"],dfplot3$Sub_metering_2[dfplot3$Date=="2007-02-01" | dfplot3$Date== "2007-02-02"],dfplot3$Sub_metering_3[dfplot3$Date=="2007-02-01" | dfplot3$Date== "2007-02-02"])
colnames(dfsubplot3) <- c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")
## Sending to device
png("plot3.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))
plot(dfsubplot3$Time,dfsubplot3$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="")
points(dfsubplot3$Time,dfsubplot3$Sub_metering_2,col="red",type="l")
points(dfsubplot3$Time,dfsubplot3$Sub_metering_3,col="blue",type="l")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Submetering 1","Submetering 2","SubMetering 3"))
dev.off()
}