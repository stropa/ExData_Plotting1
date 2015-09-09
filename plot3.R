Sys.setlocale(category = "LC_TIME", locale = "US")
df <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, na.strings = '?')
dat <- within(df, Datetime <- as.POSIXlt(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S"))
dat <- dat[dat$Datetime > as.POSIXlt('2007-02-01') & dat$Datetime < as.POSIXlt('2007-02-03'),]

energy <- dat
for (i in 3:9) energy[,i] <- as.numeric(energy[,i])


png("plot3.png")
plot(energy$Datetime, energy$Sub_metering_1, xlab = "", type = "n",
     ylab = "Energy sub metering")
lines(energy$Datetime, energy$Sub_metering_1)
lines(energy$Datetime, energy$Sub_metering_2, col = 'red')
lines(energy$Datetime, energy$Sub_metering_3, col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c('black','red','blue'), lty = c(1,1,1))
dev.off()
