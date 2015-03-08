   data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",stringsAsFactors=FALSE)

   datause <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

   #date format
   datetime <- paste(as.Date(datause$Date),datause$Time)
   datause$Datetime <- as.POSIXct(datetime)

   hist(datause$Global_active_power, main="Global Active Power", xlab="Global Active Power(Kilowatts)", ylab="Frequency", col = "red")
    
    #copy the graph
    dev.copy(png, file="plot1.png", width= 480, height=480)
    dev.off()
