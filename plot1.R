plot1 <- function() {
        data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        values <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
        
        #Draw the graph
        png(file="plot1.png")
        with(values, hist(values$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
        dev.off()
}