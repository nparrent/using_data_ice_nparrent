### Set the working directory

### Acessing Data Within R

workingdirectory = "C:\\Users\\npleg\\OneDrive\\Documents\\University of Montana\\BGEN 694\\GitHub\\manipulating_data\\car.test.frame.txt"
setwd(workingdirectory)
cardata = read.table("C:\\Users\\npleg\\OneDrive\\Documents\\University of Montana\\BGEN 694\\GitHub\\manipulating_data\\car.test.frame.txt", header=T, sep="\t")

## Install packages
install.packages("tidyr")
library("tidyr")
install.packages("dplyr")
library("dplyr")
library("tibble")

# Check out the data: headers, number of columns  and rows
head(cardata)
names(cardata)
ncol(cardata)
nrow(cardata)

# Figure out datatypes of columns
str(cardata)

# Figure out number of unique fields
unique(cardata$Type)
unique(cardata$Country)

# Values in specific fields
cardata[57,3]
cardata[24,]

# 3 methods to find row 19 with columns 1,2,3
cardata[29, c(1, 2, 3)]
cardata[29, 1:3]
cardata[29,c("Price", "Country", "Reliability")]

#2 methods to find roew 45 with columns 3 and 7
cardata[45,c(3,7)]
cardata[45,c("Reliability", "Disp.")]

# Create a new dataframe for HP
hp_data = cardata[,c("HP")]
hp_data1 = cardata[,8]

### Sorting and Ordering Data

library(dplyr)
compact_cars = select(cardata, Country, Type, Reliability)
compact_cars %>%
filter(Type == "Compact", Reliability >=4)

# Reliability >= 3 from Japan not US
compact_cars %>%
filter(Type == "Compact" & Reliability >= 3 & Country == "Japan" & Country != "USA")

# Number of cars manufactured

compact_cars = select(cardata, Country, Type, Reliability)
compact_cars %>%
filter(Country == "Japan/USA")

cardata
compact_cars = select(cardata, Country, Type, Reliability)
compact_cars %>%
filter(Country == "USA" | Country == "Japan")

cardata
compact_cars = select(cardata, Country, Type, Reliability)
compact_cars %>%
filter((Country == "USA" | Country == "Japan") & Reliability >=4)



## Subsample
cardata
split.cardata = round(nrow(cardata)*.70,0)
nrow(split.cardata)
x= 1:60
cardata.split = cardata[sample(x,split.cardata,replace=F),]
nrow(cardata.split)

subsample = nrow(cardata)/8
nrow(subsample)

subsample1 =sort(sample(seq_len(nrow(cardata)), size=subsample))
notsubsample1 = setdiff(seq_len(nrow(cardata)), subsample1)
subsample2 =sort(sample(notsubsample1, size=subsample))
notsubsample2 = setdiff(seq_len(nrow(cardata)), subsample2)
subsample3 =sort(sample(notsubsample2, size=subsample))
notsubsample3 = setdiff(seq_len(nrow(cardata)), subsample3)
subsample4 =sort(sample(notsubsample3, size=subsample))
notsubsample4 = setdiff(seq_len(nrow(cardata)), subsample4)
subsample5 =sort(sample(notsubsample4, size=subsample))
notsubsample5 = setdiff(seq_len(nrow(cardata)), subsample5)
subsample6 =sort(sample(notsubsample5, size=subsample))
notsubsample6 = setdiff(seq_len(nrow(cardata)), subsample6)
subsample7 =sort(sample(notsubsample6, size=subsample))
notsubsample7= setdiff(seq_len(nrow(cardata)), subsample7)
subsample8 =sort(sample(notsubsample7, size=subsample))
notsubsample8 = setdiff(seq_len(nrow(cardata)), subsample8)

## Columns that are numeric
numeric_data_type = cardata[,sapply(cardata,is.numeric)]
names(numeric_data_type)

## Removing HP and Price
names(numeric_data_type)
numeric_data_type[,-c(1,6)]
# Save Country and Weight as a new dataframe
country_weight_data = cardata[, c("Country", "Weight")]
names(country_weight_data)

# Rename country and weight 
colnames(country_weight_data) = c("man_country", "car_weight")
names(country_weight_data)
