plot3 <- function() {
        data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        values <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
        combinedColumn <- paste(values$Date, values$Time)
        datetime <- strptime(combinedColumn, format = "%d/%m/%Y %H:%M:%S")
        result <- cbind(datetime, values[3:9])
        Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")
        
        #Draw the graph
        png(file="plot3.png")
        
        with(result, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black"))
        with(result, lines(datetime, Sub_metering_2, col = "red"))
        with(result, lines(datetime, Sub_metering_3, col = "blue"))
        legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        dev.off()
}
