# Unzip the dataset and store the dataset in the working directory.
# Set the working directory using the setwd() command.
# Use read.table() to read the txt file and apply the necessary parameters.
# In this case, values are separated by ; and the first line contains the 
# variable names.
data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)

# As per the question, the final data will contain values between the 
# dates 1/2/2007 and 2/2/2007.
final_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# To see the structure and dimesnsions of the selected dataset, 
# use dim() and str().
# dim(final_data)
# str(final_data)

# Use the strptime() to convert the date and time variables 
# to date/time classes in R.
datetime <- strptime(paste(final_data$Date, final_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Convert the following factor variables to numeric.
voltage <- as.numeric(final_data$Voltage)
globalActivePower <- as.numeric(final_data$Global_active_power)
globalReactivePower <- as.numeric(final_data$Global_reactive_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Select the graphic device for viewing the results in png format.
png("plot4.png", width = 480, height = 480)

# Set the plotting window.
# Use par() to partition the plotting window into 2 rows and 2 columns.
# The 4 graphs will be plotted row-wise as we have used mfrow parameter.
par(mfrow = c(2,2))

# Plot the first graph in first row, first column.
# It depicts the line graph between datetime and Global active power.
plot(datetime, globalActivePower, type = 'l', xlab = "", ylab = "Global Active Power")

# Plot the second graph in first row, second column.
# It depicts the line graph between datetime and Voltage.
plot(datetime, voltage, type = 'l', ylab = "Voltage")

# Plot the third graph in second row, first column.
# It depicts the relationship between datetime and various metering levels.
plot(datetime, subMetering1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(datetime, subMetering2, type = 'l', col = "red")
lines(datetime, subMetering3, type = 'l', col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))

# Plot the fourth graph in second row, second column.
# It depicts a line graph between datetime and Global Reactive Power.
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Close the graphic device.
dev.off()