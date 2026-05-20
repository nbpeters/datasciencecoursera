unzip("quiz1_data.zip")
library(readr)
read_csv("hw1_data.csv") -> quiz_data

#question 12 extract first 2 rows of the dataframe and print them to the console
quiz_data[1:2,]

#question 14 extract last 2 rows of the dataframe and print them to the console
quiz_data[152:153,]

#question 15 what is the value of Ozone in the 47th row
quiz_data[47,1]

#question 16 how many missing values are in the Ozone column
sum(is.na(quiz_data[1,]))

#question 17 what is the mean of the Ozone column excluding missing values
meanarg <- quiz_data[,1]
mean(meanarg[!is.na(meanarg)])

#question 18 extract the subset of rows where Ozone values are above 31 and Temp values are above 90. 
# Then, what is the mean of Solar.R in this subset
ques <- quiz_data[c("Solar.R","Ozone","Temp")]
ques
filtered_ques <- subset(ques,Ozone >31 & Temp >90)
filtered_ques
mean(filtered_ques$Solar.R)

#question 19 what is the mean of Temp when Month is equal to 6
ques2 <- quiz_data[c("Temp","Month")]
ques2
filtered_ques2 <- subset(ques2,Month == 6)
filtered_ques2
mean(filtered_ques2$Temp)

#question 20 what is the maximum ozone value in the month of May, which is month 5
May <- subset(quiz_data,Month ==5)
May
max(May["Ozone"],na.rm = TRUE)

#----------------------------------------------------------------------------------------------------------------
#PRACTICE
