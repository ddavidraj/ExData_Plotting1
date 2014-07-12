plot2 <- function()
{
  # Keep the input file in the working directory and the source file in working directory
  # execute the following to generate the plot
  # source("plot2.R")
  # plot2()
d <- read.table("household_power_consumption.txt", 
                sep=";", 
                header=TRUE
)
dfplot2 <- data.frame(as.Date(d$Date, format = "%d/%m/%Y"),strptime(paste(d$Date,d$Time), format="%d/%m/%Y %H:%M:%S"),d$Global_active_power)
colnames(dfplot2) <- c("Date","Time","GLOBAL_ACTIVE_POWER")
dfsubplot2 <- data.frame(dfplot2$Date[dfplot2$Date=="2007-02-01" | dfplot2$Date== "2007-02-02"],dfplot2$Time[dfplot2$Date=="2007-02-01" | dfplot2$Date== "2007-02-02"],dfplot2$GLOBAL_ACTIVE_POWER[dfplot2$Date=="2007-02-01" | dfplot2$Date== "2007-02-02"])
colnames(dfsubplot2) <- c("Date","Time","GLOBAL_ACTIVE_POWER")
## Sending to device
png("plot2.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))
plot(dfsubplot2$Time,as.numeric(dfsubplot2$GLOBAL_ACTIVE_POWER)/500,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
}