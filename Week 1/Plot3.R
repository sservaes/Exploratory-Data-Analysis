library(data.table)

# Assign column names and classes
colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", rep("numeric",7) )

# Read in the data
household <- read.table("./data/exploratory data analysis/household_power_consumption.txt", sep =";", header = TRUE, col.names=colNames, colClasses = colClasses, na.strings="?")
household[,1] <- as.Date(household[,1], "%d/%m/%Y")

# Select the appropriate data
select <- between(household$date, "2007-02-01", "2007-02-02")
dt <- household[select,]

# Construct the plot and export it into png
png(filename = "plot3.png")
plot(dt$subMetering1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(dt$subMetering2, col = "red")
lines(dt$subMetering3, col = "blue")
axis(1, at = c(1, 1440, 2880), labels = c("Thursday", "Friday", "Saturday"))
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
dev.off()