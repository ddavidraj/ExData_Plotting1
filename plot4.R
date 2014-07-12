plot4 <- function()
{
  # Keep the input file in the working directory and the source file in working directory
  # execute the following to generate the plot
  # source("plot4.R")
  # plot4()
  d <- read.table("household_power_consumption.txt", 
                  sep=";", 
                  header=TRUE
  )
  dfplot4 <- data.frame(as.Date(d$Date, format = "%d/%m/%Y"),strptime(paste(d$Date,d$Time), format="%d/%m/%Y %H:%M:%S"),d$Sub_metering_1,d$Sub_metering_2,d$Sub_metering_3,d$Voltage,d$Global_reactive_power,d$Global_active_power)
  colnames(dfplot4) <- c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3","Voltage","Global_reactive_power","Global_active_power")
  dfsubplot4 <- data.frame(dfplot4$Date[dfplot4$Date=="2007-02-01" | dfplot4$Date== "2007-02-02"],dfplot4$Time[dfplot4$Date=="2007-02-01" | dfplot4$Date== "2007-02-02"],dfplot4$Sub_metering_1[dfplot4$Date=="2007-02-01" | dfplot4$Date== "2007-02-02"],dfplot4$Sub_metering_2[dfplot4$Date=="2007-02-01" | dfplot4$Date== "2007-02-02"],dfplot4$Sub_metering_3[dfplot4$Date=="2007-02-01" | dfplot4$Date== "2007-02-02"],dfplot4$Voltage[dfplot4$Date=="2007-02-01" | dfplot4$Date== "2007-02-02"],dfplot4$Global_reactive_power[dfplot4$Date=="2007-02-01" | dfplot4$Date== "2007-02-02"],dfplot4$Global_active_power[dfplot4$Date=="2007-02-01" | dfplot4$Date== "2007-02-02"])
  colnames(dfsubplot4) <- c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3","Voltage","Global_reactive_power","Global_active_power")
  ## Sending to device
  png("plot4.png", width = 480, height = 480, units = "px", bg = "white")
  #par(mar= c(2, 2, 2, 1))
  par(mar=c(4,4,2,1),mfrow=c(2,2),oma=c(0,0,2,0))
  plot(dfsubplot4$Time,as.numeric(dfsubplot4$Global_active_power)/500,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  plot(dfsubplot4$Time,as.numeric(dfsubplot4$Voltage),type="l",ylab="Voltage",xlab="datetime")
  plot(dfsubplot4$Time,dfsubplot4$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="")
  points(dfsubplot4$Time,dfsubplot3$Sub_metering_2,col="red",type="l")
  points(dfsubplot4$Time,dfsubplot3$Sub_metering_3,col="blue",type="l")
  legend("topright",lty=1,col=c("black","red","blue"), legend=c("Submetering 1","Submetering 2","SubMetering 3"))
  plot(dfsubplot4$Time,as.numeric(dfsubplot4$Global_reactive_power)/500,type="l",ylab="Global Rective Power (kilowatts)",xlab="datetime")
  dev.off()
}