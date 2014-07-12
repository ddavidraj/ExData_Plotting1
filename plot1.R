plot1 <- function()
{
  # Keep the input file in the working directory and the source file in working directory
  # execute the following to generate the plot
  # source("plot1.R")
  # plot1()
d <- read.table("household_power_consumption.txt", 
                sep=";", 
                header=TRUE
)
dfplot1 <- data.frame(as.Date(d$Date, format = "%d/%m/%Y"),strptime(d$Time, format="%H:%M:%S"),d$Global_active_power)
colnames(dfplot1) <- c("Date","Time","GLOBAL_ACTIVE_POWER")
dfsubplot1 <- data.frame(dfplot1$Date[dfplot1$Date=="2007-02-01" | dfplot1$Date== "2007-02-02"],dfplot1$Time[dfplot1$Date=="2007-02-01" | dfplot1$Date== "2007-02-02"],dfplot1$GLOBAL_ACTIVE_POWER[dfplot1$Date=="2007-02-01" | dfplot1$Date== "2007-02-02"])
colnames(dfsubplot1) <- c("Date","Time","GLOBAL_ACTIVE_POWER")
## Sending to device
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))
hist(as.numeric(dfsubplot1$GLOBAL_ACTIVE_POWER)/500,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
}
