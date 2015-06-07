# read the data
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', 
                  na.strings = "?", nrows = 2075259, check.names = FALSE, 
                  stringsAsFactors = FALSE, comment.char = "", quote = '\"')
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# subset the data
data_subset <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)

# generate plot
plot(data_subset$Global_active_power ~ data_subset$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
