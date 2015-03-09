   data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",stringsAsFactors=FALSE)

   datause <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

   #date format
   datetime <- paste(as.Date(datause$Date),datause$Time)
   datause$Datetime <- as.POSIXct(datetime)

       
    #plot
    par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
    with(data,{
    	plot(Global_active_power~Datetime, type="1", ylab="Global Active Power(Kilowatts)", xlab="")
    	plot(Voltage~Datetime, type="1", ylab="Voltage(volt)", xlab="")
    	plot(Sub_metering_1~Datetime, type="1",ylab="Global Active Power(Kilowatts)", xlab="" )
    	
    	lines(Sub_metering_2~Datetime, col="red")
    	lines(Sub_metering_3~Datetime,col="Blue")
    	legend("topright", col=c("black","red","blue"), lty=2, lwd=2, bty="n" legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     plot(Global_reactive_power~Datetime, type="1", ylab="Global Rective Power(Kolowatts)", xlab="")
 })
 
    #copy the graph
    dev.copy(png, file="plot4.png", width= 480, height=480)
    dev.off()
