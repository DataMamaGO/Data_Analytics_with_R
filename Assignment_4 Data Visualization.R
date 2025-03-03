#Assignment_4 Data Visualization
#Oksana Goljevacki
#1.Import Premium and Claim data and merge both data sets into one data.

Premium<-read.csv("C:/Users/datam/Desktop/CSVs/Premiums.csv", header=TRUE)
Premium
head(Premium)
Claims<read.csv("C:/Users/datam/Desktop/CSVs/Claims.csv",header = TRUE)
Claims
head(Claims)
Premium_Claims_Merge<-merge(Premium,Claims, by=c("POLICY_NO"),all=TRUE)
Premium_Claims_Merge
head(Premium_Claims_Merge)

#2.For each zone,
#obtain the mean Premium and plot a bar chart showing the mean Premium over zone. 
# (Use any color from a palette from R( Color Brewer)
install.packages(dplyr)

library(dplyr)

Premium_mean<-Premium %>%
  group_by(ZONE_NAME) %>%
  summarise(Premium_mean = mean(Premium, na.rm = TRUE))
View(Premium_mean)

#plot
install.packages("ggplot2")
library(ggplot2)
ggplot(Premium_mean, aes(x = ZONE_NAME, y = Premium_mean)) +
  geom_bar(stat = 'identity', fill = 'purple') +
  labs(title = 'Premium mean by Zone Name',
       x = 'Zone name',
       y = 'Premium mean') +
  theme_minimal()

#3.Obtain a stacked bar chart for all the Zones over Sub plans by the Premium amount. 
# Stacked Bar Chart

library(dplyr)
library(tidyr)
library(ggplot2)
# Load the CSV file
Premium <- read.csv("C:/Users/datam/Desktop/CSVs/Premiums.csv", header=TRUE)
Premium

Premium_long <- Premium %>%
  pivot_longer(cols = starts_with("Premium"), names_to = "Premium_Type", values_to = "Premium_Amount")


ggplot(Premium_long, aes(x = ZONE_NAME, y = Premium_Amount, fill = Sub_Plan)) +
  geom_bar(stat = "identity") +
  labs(title = "Premium Amount by Zone and Sub Plan",
       x = "Zone Name",
       y = "Premium Amount") +
  theme_minimal()

#4.Obtain a heat map of Plan and Zone with respective average Premium.
library(dplyr)
library(ggplot2)
ggplot(Premium_mean, aes(x = "ZONE_NAME", y = "Plan", fill = Premium_mean)) +
  geom_tile() +
  scale_fill_gradient(low = "yellow", high = "brown") +
  labs(title = "Average Premium by Zone and Plan",
       x = "Zone Name",
       y = "Plan",
       fill = "Premium mean") +
  theme_minimal()

#5.Obtain a pie chart using ggplot2 for Premium amount across different sub plans.
#(Use any palette from R (Color Brewer)
Premium <- read.csv("C:/Users/datam/Desktop/CSVs/Premiums.csv", header=TRUE)
summary(Premium)
install.packages("RColorBrewer")
library(dplyr)
library(ggplot2)
library(RColorBrewer)

# Creating Pie chart with percentage

Premium_Pie <- aggregate(Premium ~ Sub_Plan, data = Premium, FUN = sum)
Premium_Pie$pct <- round(Premium_Pie$Premium / sum(Premium_Pie$Premium) * 100)
labels <- paste(Premium_Pie$Sub_Plan, "(", Premium_Pie$pct, "%)", sep = "")
  pie(Premium_Pie$Premium, labels = labels,
    col = c("darkcyan", "orange", "yellowgreen","yellow"),
    main = "Premium Amount by Sub Plan with percentage")


