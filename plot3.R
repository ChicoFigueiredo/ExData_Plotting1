##############################################################################
# Load the data.frame Eletric.Data.Consumption
# Result for code plot0-Preparate-Data.R 
# plot0-Preparate-Data.R download, reading and tidy in code
# case do you prefer run that code, use
# source("plot0-Preparate-Data.R")
# or
# load("data/household_power_consumption.data.table");
# for fast read

source("plot0-Preparate-Data.R")
#load("data/household_power_consumption.data.table");
#head(Eletric.Data.Consumption)


library(lubridate)
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

##############################################################################
# Step 1: plot
with(Filter.Eletric.Data.Consumption,
     plot(DateTime, Sub_metering_1
          ,type = "l"
          ,col = "black"
          ,main = ""
          ,xlab = ""
          ,ylab = "Energy sub metering"
))

with(Filter.Eletric.Data.Consumption,
     lines(DateTime, Sub_metering_2
           ,type = "l"
           ,col = "red"
     ))

with(Filter.Eletric.Data.Consumption,
     lines(DateTime, Sub_metering_3
           ,type = "l"
           ,col = "blue"
     ))

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       lwd=2, 
       cex = .7,
       col=c("black", "red", "blue")
        )

##############################################################################
# Step 3: Save PNG
dev.copy(png,"plot3.png",width = 480, height = 480)
dev.off()
