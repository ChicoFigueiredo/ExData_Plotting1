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
     plot(DateTime, Global_active_power
          ,type = "l"
          ,col = "black"
          ,main = ""
          ,xlab = ""
          ,ylab = "Global Active Power (kilowatts)"
     )
)

##############################################################################
# Step 3: Save PNG
dev.copy(png,"plot2.png",width = 480, height = 480)
dev.off()
