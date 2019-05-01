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

# Conversion of Global_active_power variable to numeric.
globalActivePower <- as.numeric(final_data$Global_active_power)

# Select the graphic device for viewing the results in png format.
png("plot1.png", width = 480, height = 480)

# Plot the histogram and label it.
hist(globalActivePower, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# Close the graphic device.
dev.off()