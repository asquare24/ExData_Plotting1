data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
final_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# dim(final_data)
# str(final_data)
globalActivePower <- as.numeric(final_df$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()