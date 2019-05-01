# Unzip the dataset and store the dataset in the working directory.
# Set the working directory using the setwd() command.
# Use read.table() to read the txt file and apply the necessary parameters.
# In this case, values are separated by ; and the first line contains the 
# variable names.
data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)

# As per the question, the final data will contain values between 
# the dates 1/2/2007 and 2/2/2007.
final_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# To see the structure and dimesnsions of the selected dataset, 
# use dim() and str().
# dim(final_data)
# str(final_data)

# Use the strptime() to convert the date and time variables 
# to date/time classes in R.
datetime <- strptime(paste(final_data$Date, final_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Convert the factor values to numeric.
subMetering1 <- as.numeric(final_data$Sub_metering_1)
subMetering2 <- as.numeric(final_data$Sub_metering_2)
subMetering3 <- as.numeric(final_data$Sub_metering_3)

# Select the graphic device for viewing the results in png format.
png("plot3.png", width = 480, height = 480)

# Plot a line graph with datetime on x-axis and Sub metering 1 on y-axis.
plot(datetime, subMetering1, xlab = "", ylab = "Energy sub metering", type = "l")

# Add a line graph to the above plot by using the lines() function.
# Show relatioship between datetime and sub metering 2 using line colour red.
lines(datetime, subMetering2, type = 'l', col = "red")

# Add a line graph to the above plot by using the lines() function.
# Show relatioship between datetime and sub metering 3 using line colour blue.
lines(datetime, subMetering3, type = 'l', col = "blue")

# Add legend text to the above plot at the topright corner.
# Label it appropriately. Use lty for line style, lwd for line width.
# Use col parameter to show the colors used for representing various sub meterings.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))

# Close the graphic device.
dev.off()