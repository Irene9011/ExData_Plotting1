  data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",stringsAsFactors=FALSE)

   datause <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

   #date format
   datetime <- paste(as.Date(datause$Date),datause$Time)
   datause$Datetime <- as.POSIXct(datetime)

       
    #plot
    plot(data$Global_active_power~data$Datetime, type="1", ylab="Global Active Power(Kilowatts)", xlab="")
    
    #copy the graph
    dev.copy(png, file="plot2.png", width= 480, height=480)
    dev.off() 
