# Load needed packages
library(tidyr)
library(dplyr)
library(stringr)


# set working directory and import dataset
df<- read.csv("salary_survey.csv", header = T, sep=",")


## What are the issues associated with this dataset 
# Colunn names are too long, need to change to code friendly names (i.e. one word to short phrase with words seperated by '.' or '_')
colnames(df)[2]<- "Age"
colnames(df)[3]<- "Employment_Industry"
colnames(df)[4]<- "Job_Title"
colnames(df)[5]<- "Job_Title_misc"
colnames(df)[6]<- "Salary"
colnames(df)[7]<- "Salary_additional"
colnames(df)[8]<- "Currency"
colnames(df)[9]<- "Currency_other"
colnames(df)[10]<- "Salary_misc"
colnames(df)[11]<- "Country"
colnames(df)[12]<- "US_State"
colnames(df)[13]<- "US_City"
colnames(df)[14]<- "Overall_Experience"
colnames(df)[15]<- "Focused_Experience"
colnames(df)[16]<- "Highest_Education"
colnames(df)[17]<- "Gender"
colnames(df)[18]<- "Race"


# Column 1: We should split this column into 2 columns: date and time 
# To make data tidy, each of these should be split in to 3 columns (month, day, year & hour, minute, second)
df2<- df %>% separate(Timestamp, c("Date", "Time"), sep=" ")



