Sys.setlocale(category = "LC_TIME", locale = "US")
df <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, na.strings = '?')
dat <- within(df, Datetime <- as.POSIXlt(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S"))
dat <- dat[dat$Datetime > as.POSIXlt('2007-02-01') & dat$Datetime < as.POSIXlt('2007-02-03'),]

energy <- dat
for (i in 3:9) energy[,i] <- as.numeric(energy[,i])

png("plot1.png")
hist(energy$Global_active_power, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()


