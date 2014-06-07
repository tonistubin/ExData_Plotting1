plot4 <- function() {
        data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        values <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
        combinedColumn <- paste(values$Date, values$Time)
        datetime <- strptime(combinedColumn, format = "%d/%m/%Y %H:%M:%S")
        result <- cbind(datetime, values[3:9])
        Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")
        
        #Draw the graph
        png(file="plot4.png")
        par(mfrow = c(2,2)) 
        with(result, {
                plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
                plot(datetime, Voltage, type = "l")
                plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
                lines(datetime, Sub_metering_2, col = "red")
                lines(datetime, Sub_metering_3, col = "blue")
                legend("topright", bty = "n", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                plot(datetime, Global_reactive_power, type = "l")
        })
        
        dev.off()
}
