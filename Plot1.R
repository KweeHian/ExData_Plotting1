# Read Data
ds <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")

# Subset data
subdata <- subset(ds, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(ds)

# Convert dates
dtetme <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(dtetme)

# Save plot to png
hist(subdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
