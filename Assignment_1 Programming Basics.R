#Assignment_1 Programming Basics/Oksana Goljevacki 
#Programming Basics in R Questions

#1.Create a matrix with three rows A,B and C and four columns with names
#Q, W, E and R.Fill the matrix with any numbers between 1 and 10.

matrix1<-matrix(c(1,2,3,4,5,6,7,8,9,2,6,5),nrow = 3,byrow = TRUE)
row.names(matrix1)<-c("A","B","C")
colnames(matrix1)<-c("Q","w","E","R")
print(matrix1)
#Q w E R
#A 1 2 3 4
#B 5 6 7 8
#C 9 2 6 5

#2. x = 24, y =”Hello World”, z = 93.65.
#Identify the class of x, y and z and convert all three into factor.
x <- 24
y <- "Hello World"
z <- 93.65

class(x)  
class(y)  
class(z) 
#[1] "numeric"
#> class(y)   # Returns "character"
#[1] "character"
#> class(z) 
#[1] "numeric"
x_factor<-factor(x)
class(x_factor)
y_factor<-factor(y)
class(y_factor)
z_factor<-factor(z)
class(z_factor)

#3. q = 65.9836
#a. Find square root of q and round it up to 3 digits.
#b. Check if log to the base 10 of q is less than 2.
q<-65.9836
sqrt(q)
#[1] 8.123029
q1<- round(8.123029, digits = 3)
print(q1) 
#[1] 8.123
log10(q)
#[1] 1.819436   ( less than 2)

#4. x = c(“Intelligence”, “Knowledge”, “Wisdom”, “Comprehension”)
#y = “I am”
#z="intelligent"
#a. Find first 4 letters of each word in x.
#b. Combine y and z to form a sentence “I am intelligent”
#c. Convert all the words in x to upper case.

x <- c("Intelligence", "Knowledge", "Wisdom", "Comprehension")
First_4_Letters<- substr(x, 1, 4)
First_4_Letters
print(First_4Letters)  

#[1] "Inte" "Know" "Wisd" "Comp"

y <- "I am"
z <- "intelligent"
sentence <- paste(y, z)
print(sentence)
#[1] "I am intelligent"

upper_x<-toupper(x)
upper_x
#[1] "INTELLIGENCE"  "KNOWLEDGE"     "WISDOM"        "COMPREHENSION"

#5. a = c(3,4,14,17,3,98,66,85,44)
#Print “Yes” if the numbers in ‘a’ are divisible by 3 and
#“No” if they are not divisible by 3 using ifelse().
a<-c(3,4,14,17,3,98,66,85,44)
ifelse(a%%3==0,"yes","no")
#[1] "yes" "no"  "no"  "no"  "yes" "no"  "yes" "no"  "no" 

#6. b = c(36,3,5,19,2,16,18,41,35,28,30,31)
#List all the numbers less than 30 in b using for loop.

b <- c(36, 3, 5, 19, 2, 16, 18, 41, 35, 28, 30, 31)
Less30 <- c() 

for (number in b) {
  if (number < 30) {
    Less30 <- c(Less30, number)
  }
}

print(Less30)
#[1]  3  5 19  2 16 18 28


#7. Date = “01/30/18”
#a) Convert Date into standard date format (yyyy-mm-dd) and name it as Date_new.
#b) Extract day of week and month from Date_new.
#c) Find the difference in the current system date and Date_new.

Date <- "01/30/18"
Date_new <- as.Date(Date, format = "%m/%d/%y")
Date_new
#[1] "2018-01-30"

Date_new <- "2018-01-30"
Date_new <- as.Date(Date_new)  
weekdays(Date_new)  
months(Date_new)    

#> weekdays(Date_new)  # Get the weekday
#[1] "Tuesday"
#> months(Date_new)    # Get the month
#[1] "January"

