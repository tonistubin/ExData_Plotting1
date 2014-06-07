plot2 <- function() {
        data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        values <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
        combinedColumn <- paste(values$Date, values$Time)
        datetime <- strptime(combinedColumn, format = "%d/%m/%Y %H:%M:%S")
        result <- cbind(datetime, values[3:9])
        Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")

        #Draw the graph
        png(file="plot2.png")
        with(result, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
        dev.off()
}