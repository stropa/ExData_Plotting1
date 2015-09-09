Sys.setlocale(category = "LC_TIME", locale = "US")
df <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, na.strings = '?')
dat <- within(df, Datetime <- as.POSIXct(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S"))
dat <- dat[dat$Datetime > as.POSIXct('2007-02-01') & dat$Datetime < as.POSIXct('2007-02-03'),]

energy <- dat
for (i in 3:9) energy[,i] <- as.numeric(energy[,i])

png("plot4.png")
par(mfrow = c(2,2))

plot(energy$Datetime, energy$Global_active_power, type = "n", xlab = "", 
     ylab = "Global Active Power")
lines(energy$Datetime, energy$Global_active_power)


plot(energy$Datetime, energy$Voltage, type = "n", xlab = "datetime", 
     ylab = "Voltage")
lines(energy$Datetime, energy$Voltage)

plot(energy$Datetime, energy$Sub_metering_1, xlab = "", type = "n",
     ylab = "Energy sub metering")
lines(energy$Datetime, energy$Sub_metering_1)
lines(energy$Datetime, energy$Sub_metering_2, col = 'red')
lines(energy$Datetime, energy$Sub_metering_3, col = 'blue')
legend("topright", bty = "n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c('black','red','blue'), lty = c(1,1,1))

plot(energy$Datetime, energy$Global_reactive_power, type = "n", xlab = "datetime", 
     ylab = "Global_reactive_power")
lines(energy$Datetime, energy$Global_reactive_power)

dev.off()
