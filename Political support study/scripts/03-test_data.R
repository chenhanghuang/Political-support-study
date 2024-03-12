#### Preamble ####
# Purpose: test the variable to see if the variable in the right format and range  
# Author: Chenhang Huang,Zixuan Yang
# Date: 02 Mar 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: Uoft
# Pre-requisites: no



## There are 5 variables in the clean dataset

## voted_for is the string variable on the vote preference
## gender is the string variable with two levels male and female 
## education  has 6 levels: 
## age represents voters' age, should be larger than 18.
## white is string variable shows the race. 

#### Workspace setup ####
library(tidyverse)

#### Test data ####

data = read_csv("data/analysis_data/analysis_data.csv")

## test if there are only two candidates of voted_for :"Trump" , "Biden"
data$voted_for |>
  unique() == c("Trump" , "Biden")

## test if the voted_for is string variable 
data$voted_for |> class() == "character"

## test if the gender is string variable 
data$gender |> class() == "character"

## test if the gender has two levels 
data$gender |>
  unique() == c("Male" , "Female")


## test if the education is string variable 
data$education |> class() == "character"

## test if the gender has two levels 
data$education |>
  unique() == c(  "2-year",
                  "4-year",
                  "Some college",
                  "High school graduate","Post-grad",
                  "No HS")


## test if age is numeric 
data$age |> class() == "numeric"

## test if the minimum of age is larger than 18
data$age |> min() >= 18

## test if there are only two candidates of white :"Yes" , "No"
data$white |>
  unique() == c("Yes" , "No")

## test if the white is string variable 
data$white |> class() == "character"




