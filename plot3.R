   data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",stringsAsFactors=FALSE)

   datause <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

   #date format
   datetime <- paste(as.Date(datause$Date),datause$Time)
   datause$Datetime <- as.POSIXct(datetime)

       
    #plot
    with(data,{
    	plot(Sub_metering_1~Datetime, type="1", ylab="Global Active Power(Kilowatts)", xlab="")
    	lines(Sub_metering_2~Datetime, col="red")
    	lines(Sub_metering_3~Datetime,col="Blue")
    	
    })
    legend("topright", col=c("black","red","blue"), lty=2, lwd=2, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
 
    #copy the graph
    dev.copy(png, file="plot3.png", width= 480, height=480)
    dev.off()
