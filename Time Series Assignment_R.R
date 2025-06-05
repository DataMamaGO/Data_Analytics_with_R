
#Time Series Assignment
#Oksana Goljevacki 

#BACKGROUND: 

#The data contains monthly sales (in million USD) of a leading processed food manufacturer in USA. 
#Data for 3 business units, from February 2015 to January 2018, is provided in the same file. 
#Columns – Year, Month, BU1, BU2, BU3
#Number of observations – 36 for each business unit

#QUESTIONS-
  
#1.Import ‘USA Firm Sales’ data in R/PYTHON

#2.Create time series objects of the data.

#3.Check for stationarity for each of the three series.

#4.Obtain best model for each BU.

#5.Predict sales for each BU for January 2018, February 2018, March 2018. 

#1.
library(tidyverse)
library(lubridate)
library(ggplot2)
library(forecast)
library(urca)


sales <- read_csv("C:/Users/duoxa/Desktop/TS_module/USA FIRM SALES DATA.csv")
head(sales)

tail(sales)
#EDA for the data 
str(sales)

#spc_tbl_ [35 × 5] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
#$ Year : num [1:35] 2015 2015 2015 2015 2015 ...
#$ Month: chr [1:35] "February" "March" "April" "May" ...
#$ BU1  : num [1:35] 125 124 123 123 123 ...
#$ BU2  : num [1:35] 116 116 116 118 118 ...
#$ BU3  : num [1:35] 114 114 114 114 115 ...

summary(sales)
#Year         Month                BU1             BU2             BU3       
#Min.   :2015   Length:35          Min.   :123.1   Min.   :115.5   Min.   :113.8  
#1st Qu.:2015   Class :character   1st Qu.:129.0   1st Qu.:120.2   1st Qu.:117.2  
#Median :2016   Mode  :character   Median :132.7   Median :122.7   Median :120.0  
#Mean   :2016                      Mean   :131.8   Mean   :123.2   Mean   :120.3  
#3rd Qu.:2017                      3rd Qu.:135.7   3rd Qu.:126.7   3rd Qu.:124.2  
#Max.   :2017                      Max.   :140.6   Max.   :131.0   Max.   :127.5 

dim(sales)
#1] 35  5
colSums(is.na(sales))
# Year Month   BU1   BU2   BU3 
# 0     0     0     0     0 

#2.Create time series objects of the data

# Convert Month names to numbers
sales$Month <- match(sales$Month, month.name)


# Create time series objects (monthly frequency)
bu1_series <- ts(sales$BU1, start = c(2015, 2), end = c(2017, 12), frequency = 12)
bu2_series <- ts(sales$BU2, start = c(2015, 2), end = c(2017, 12), frequency = 12)
bu3_series <- ts(sales$BU3, start = c(2015, 2), end = c(2017, 12), frequency = 12)


#3.Check for stationarity for each of the three series.
# Plot each series
plot(bu1_series, col = "blue", main = "BU1 Sales", ylab = "Sales", xlab = "Time")
plot(bu2_series, col = "red", main = "BU2 Sales", ylab = "Sales", xlab = "Time")
plot(bu3_series, col = "green", main = "BU3 Sales", ylab = "Sales", xlab = "Time")

#A non-stationary time series.

install.packages("tseries")  



bu1_diff <- diff(bu1_series, differences = 1)
plot(bu1_diff, col = "blue", main = "Differenced BU1")

bu2_diff <- diff(bu2_series, differences = 1)
plot(bu2_diff, col = "red", main = "Differenced BU2")

bu3_diff <- diff(bu3_series, differences = 1)
plot(bu3_diff, col = "green", main = "Differenced BU3 Series", ylab = "Differenced Values", xlab = "Time")

install.packages("forecast")
library(forecast)

# ADF test for BU1
adf.test(bu1_series)
#Dickey-Fuller = -2.7711, Lag order = 3, p-value = 0.2737
#p >0.05 ,non stationary 

# ADF test for BU2
adf.test(bu2_series)
#Dickey-Fuller = -1.8963, Lag order = 3, p-value = 0.6134
# p >0.05 ,non stationary 

# ADF test for BU3
adf.test(bu3_series)
#Dickey-Fuller = -2.5416, Lag order = 3, p-value = 0.3628
#p>0.05 , non stationary

# First-order differencing (regular differencing)

bu1_diff <- diff(bu1_series, differences = 1)
bu2_diff <- diff(bu2_series, differences = 1)
bu3_diff <- diff(bu3_series, differences = 1)reen", main = "Differenced BU3")

library(tseries)
#Check for stationary after differencing
adf.test(bu1_diff)
adf.test(bu2_diff)
adf.test(bu3_diff)


# Seasonal differencing after regular differencing
bu1_diff_seasonal <- diff(bu1_diff, lag = 12)
bu2_diff_seasonal <- diff(bu2_diff, lag = 12)
bu3_diff_seasonal <- diff(bu3_diff, lag = 12)

par(mfrow = c(3, 1))
plot(bu1_diff_seasonal, main = "BU1 - Differenced (1st + Seasonal)", ylab = "Diff Sales")
plot(bu2_diff_seasonal, main = "BU2 - Differenced (1st + Seasonal)", ylab = "Diff Sales")
plot(bu3_diff_seasonal, main = "BU3 - Differenced (1st + Seasonal)", ylab = "Diff Sales")
par(mfrow = c(1, 1))

library(tseries)

# Augmented Dickey-Fuller test
adf.test(bu1_diff_seasonal)
adf.test(bu2_diff_seasonal)
adf.test(bu3_diff_seasonal)
# Non-stationary and seasonal (ADF p-value > 0.05)

#4.Fit best SARIMA models automatically
model_bu1 <- auto.arima(bu1_series, seasonal = TRUE)
model_bu2 <- auto.arima(bu2_series, seasonal = TRUE)
model_bu3 <- auto.arima(bu3_series, seasonal = TRUE)

summary(model_bu1)
summary(model_bu2)
summary(model_bu3)

#5.Predict sales for each BU for January 2018, February 2018, March 2018. 
forecast_bu1 <- forecast(model_bu1, h = 3)
forecast_bu2 <- forecast(model_bu2, h = 3)
forecast_bu3 <- forecast(model_bu3, h = 3)

plot(forecast_bu1, main = "BU1 Forecast")
plot(forecast_bu2, main = "BU2 Forecast")
plot(forecast_bu3, main = "BU3 Forecast")


dec2017 <- tail(sales, 1)
forecast_table <- data.frame(
  BU1 = c(dec2017$BU1, as.numeric(forecast_bu1$mean)),
  BU2 = c(dec2017$BU2, as.numeric(forecast_bu2$mean)),
  BU3 = c(dec2017$BU3, as.numeric(forecast_bu3$mean))
)
rownames(forecast_table) <- c("Dec 2017", "Jan 2018", "Feb 2018", "Mar 2018")
print(forecast_table)

#           BU1      BU2      BU3
#Dec 2017 139.0000 131.0000 127.5000
#Jan 2018 138.9859 131.7179 127.9471
#Feb 2018 138.0859 132.1785 128.3477
#Mar 2018 135.9859 132.6391 128.7483
-