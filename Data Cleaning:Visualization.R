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
df2<- df %>% tidyr::separate(Timestamp, c("Date", "Time"), sep=" ")

# Group time data into hour intervals? 


# Employment_Industry column is not consistent in its capitalization/style of answer. 
# We will do two things 1.) Capitalize all important words and 2.) Summarize sentence responses
# 1.)
capitalized<- tools::toTitleCase(as.character(df2$Employment_Industry))

df2['Employment_Industry'] <- capitalized

#2.) 
test<- as.data.frame(subset(df2, nchar(as.character(Employment_Industry)) >= 40))


# We will also make the Job_Title column a consistent format
capitalized2<- tools::toTitleCase(as.character(df2$Job_Title))

df2['Job_Title'] <- capitalized2


# Looking at the 'Salary' column, we see that some people entered in a shorthand version of their pay.
# For example, instead of $58,000/year, they typed 58. We are going to assume that in these instances 
# they meant X thousand/year. So, we need to add ',000' to cells that are formatted incorrectly (except
# for cells that equal zero). 
test<- as.data.frame(subset(df2, nchar(as.character(Salary)) <=2 ))



test<- df2 %>% filter(nchar(as.character(Salary)) ==2) & nchar(as.character(Salary))!=0) %>% 
  str_pad(width=5, side="right", pad=0)

# We also need to do this for values < 10,000. As the above function fills the cells to be 5 characters long,
# we need to do the same with these values- adding zeros until values are 4 characters long. 
test3<- df2 %>% filter(nchar(as.character(Salary)) ==2) 

str_pad(df2$Salary, width=5, side = "right", pad="0")

test5<- str_pad(df2, 5, side="right", pad="0")

homer_fall$label<- sub("^", "n=", homer_fall$label)



