#Assignment_2 Data Management
#Oksana Goljevacki

#QUESTIONS-
# 1. Import Premiums data and name it as Premium.

Premium <- read.csv("C:/Users/datam/Desktop/CSVs/Premiums.csv", header = TRUE)
Premium

#2. Check number of rows, columns in the data.
View(Premium)

#3. Display first 10 rows and last 5 rows.

head(Premium,10)
tail(Premium,5)

#4. Describe (summarize) all variables.

summary(Premium)

#5. Display top 5 and bottom 5 policies in terms of premium amount.
install.packages("dplyr")
library(dplyr)
install.packages("magrittr")
library(magrittr)

Premium <- read.csv("C:/Users/datam/Desktop/CSVs/Premiums.csv", header = TRUE)
Premium
top_row<-Premium[ , c(1,8)]
View(top_row)
head(top_row)

library(dplyr)
top_row2 <- top_row %>%
  arrange(Premium) %>%
  head(5)
print(top_row2)


library(dplyr)
top_row1 <- top_row %>%
  arrange(desc(Premium)) %>%
  head(5)
print(top_row1)
##or
library(dplyr)
top_row2 <- top_row %>%
  arrange(Premium) %>%
  tail(5)
print(top_row2)


#6. Calculate the sum for variable ‘Sum_Assured’ by ‘Region’ variable.
library(dplyr)
summary_by_region <- Premium %>%
  group_by(REGION) %>%
  summarise(total_Sum_Assured = sum(Sum_Assured, na.rm = TRUE))
print(summary_by_region)

#7. Create a subset of policies of Asia Standard Plan with Sum_Assured < = 50,000.
#Keep variables Policy_No, Zone_name, Plan and Sum_Assured in the subset data.

subset_policies <- Premium %>%
  filter(Plan == "Asia Standard Plan" & Sum_Assured <= 50000) %>%
  select("POLICY_NO", "ZONE_NAME", "Plan", "Sum_Assured")
print(subset_policies)
head(subset_policies)

#8. Export the subsetted data into an xlsx file.
install.packages("writexl")
library(writexl)

subset_policies <- Premium %>%
  filter(Plan == "Asia Standard Plan" & Sum_Assured <= 50000) %>%
  select(`POLICY_NO`, `ZONE_NAME`, `Plan`, `Sum_Assured`)
write_xlsx(subset_policies, "subset_policies.xlsx")
View(write_xlsx(subset_policies, "subset_policies.xlsx"))
