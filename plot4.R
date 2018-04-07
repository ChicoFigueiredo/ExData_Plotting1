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

##############################################################################
# Step 1: Parametrize
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

##############################################################################
# Step 1: plot

with(Filter.Eletric.Data.Consumption,
     plot(DateTime, Global_active_power
          ,type = "l"
          ,col = "black"
          ,main = ""
          ,xlab = ""
          ,ylab = "Global Active Power (kw)"
     )
)


with(Filter.Eletric.Data.Consumption,
     plot(DateTime, Voltage
          ,type = "l"
          ,col = "black"
          ,main = ""
          ,xlab = "Date and Time"
          ,ylab = "Voltageg"
     ))


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
       lwd=2.5, 
       cex = 0.5,
       col=c("black", "red", "blue")
)


with(Filter.Eletric.Data.Consumption,
     plot(DateTime, Global_reactive_power
          ,type = "l"
          ,col = "black"
          ,main = ""
          ,xlab = "Date and Time"
          ,ylab = "Global Reactive Power (kw)"
     )
)

##############################################################################
# Step 3: Save PNG
dev.copy(png,"plot4.png",width = 480, height = 480)
dev.off()
