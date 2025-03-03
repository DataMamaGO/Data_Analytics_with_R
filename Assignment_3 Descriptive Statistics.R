
library(readr)
## Assignment_3 Descriptive Statistics
#Oksana Goljevacki

#1.Import Premiums data.
Premium <- read.csv("C:/Users/datam/Desktop/CSVs/Premiums.csv" ,header = TRUE)
Premium
head(Premium)
summary (Premium)

#2.Obtain the Mode for the count of policies available across each Zone.

freq <- table(Premium$ZONE_NAME)
freq

#3.Obtain box-whisker plots for Vintage period. 

install.packages("ggplot2")

library(ggplot2)
ggplot(Premium, aes(x = Premium, y = Vintage_Period)) +
  geom_boxplot() +
  labs(title = "Box-Whisker Plot for Vintage Period",
       x = "Premium",
       y = "Vintage_Period")


#4.Detect outliers if present. Hint: use Boxplot() function of ‘car’ Package
install.packages("car")
library(car)
Premium <- read.csv("C:/Users/datam/Desktop/CSVs/Premiums.csv" ,header = TRUE)
Premium
print(names(Premium))
library(car)
Boxplot(Premium$Vintage_Period, id.method = "y", id.n =
          sum(!is.na(Premium$Vintage_Period)))

#5.Find skewness and kurtosis of Premium amount by Zone.

Premium <- read.csv("C:/Users/datam/Desktop/CSVs/Premiums.csv" ,header = TRUE)
Premium
install.packages("e1071)
library(e1071)
skewness_value <- skewness(Premium$Premium,South, type=2)
print(skewness_value)
f <- function(x)c(skew = skewness(x,type = 2),kurt = kurtosis(x,type = 2))
aggregate(Premium~ZONE_NAME,data = Premium,FUN = f)

#6.Draw a scatter plot of Premium and Vintage period. 

plot(Premium$Vintage_Period,Premium$Premium,col="red")

#7.Find the correlation coefficient between Premium and Vintage period and interpret 
#the value.
cor(Premium$Premium,Premium$Vintage_Period)
