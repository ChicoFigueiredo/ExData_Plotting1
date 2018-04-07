
##############################################################################
# Step 00: Prepare enviroment
library(data.table)
library(dplyr)
library(lubridate)

##############################################################################
# Step 01: Download, extract and loading data
url.data <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";

if(!dir.exists("data")){
  dir.create("data");  
}

file.zip <- file.path("data", "Eletric.Data.Consumption.zip");

download.file(url.data,file.zip);

utils::unzip(file.zip,exdir = "data");

file.txt <- file.path("data", "household_power_consumption.txt");

Eletric.Data.Consumption <- data.frame(
  read.csv(file.txt,
            sep = ";",
            dec=".",
            header = TRUE,
            stringsAsFactors = FALSE
));

##############################################################################
# Step 01: Mutate Data

Eletric.Data.Consumption <- mutate(Eletric.Data.Consumption,
             DateTime = dmy_hms(paste(Date , " " , Time)),
             Date = dmy(Date),
             Time = hms(Time),
             Global_active_power = as.numeric(Global_active_power),
             Global_reactive_power = as.numeric(Global_reactive_power),
             Voltage = as.numeric(Voltage),
             Global_intensity = as.numeric(Global_intensity),
             Sub_metering_1 = as.numeric(Sub_metering_1),
             Sub_metering_2 = as.numeric(Sub_metering_2),
             Sub_metering_3 = as.numeric(Sub_metering_3)
      )

Filter.Eletric.Data.Consumption <- 
  filter(Eletric.Data.Consumption, 
         Date %in% c(ymd("2007-02-01"),ymd("2007-02-02")))


##############################################################################
# Step 02: Save binary data.frame for user later in plots

file.Eletric.Data.Consumption <- file.path("data", "household_power_consumption.data.table");
unlink(file.Eletric.Data.Consumption);
save(Eletric.Data.Consumption,file = file.Eletric.Data.Consumption)

file.Filter.Eletric.Data.Consumption <- file.path("data", "filter.household_power_consumption.data.table");
unlink(file.Filter.Eletric.Data.Consumption);
save(Filter.Eletric.Data.Consumption,file = file.Filter.Eletric.Data.Consumption)


##############################################################################
# Step 03: Save binary data.frame for user later in plots
unlink(file.zip);
unlink(file.txt);

