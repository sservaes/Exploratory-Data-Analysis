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
png(filename = "plot1.png")
hist(dt$globalActivePower, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()