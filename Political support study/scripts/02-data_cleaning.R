#### Preamble ####
# Purpose: clean and prepare the data for analysis
# Author: Chenhang Huang,Zixuan Yang
# Date: 2 Mar 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: UOT
# Pre-requisites: no
# data source: 


#### Workspace setup ####
library(tidyverse)

#### Clean data ####

ces2020 <-
  read_csv(
    "data/raw_data/ces2020.csv",
    col_types =
      cols(
        "votereg" = col_integer(),
        "CC20_410" = col_integer(),
        "gender" = col_integer(),
        "educ" = col_integer(),
        "birthyr" = col_integer(),
        "race" = col_integer()
      )
  )



ces2020 <-
  ces2020 |>
  filter(votereg == 1,
         CC20_410 %in% c(1, 2)) |>
  mutate(
    voted_for = if_else(CC20_410 == 1, "Biden", "Trump"),
    voted_for = as_factor(voted_for),
    gender = if_else(gender == 1, "Male", "Female"),
    education = case_when(
      educ == 1 ~ "No HS",
      educ == 2 ~ "High school graduate",
      educ == 3 ~ "Some college",
      educ == 4 ~ "2-year",
      educ == 5 ~ "4-year",
      educ == 6 ~ "Post-grad"
    ),
    education = factor(
      education,
      levels = c(
        "No HS",
        "High school graduate",
        "Some college",
        "2-year",
        "4-year",
        "Post-grad"
      )
    ),
    age = 2020 - birthyr,
    white = if_else(race == 1, "Yes", "No")
  ) |>
  select(voted_for, gender, education,age,white)


#### Save data ####
write_csv(ces2020, "data/analysis_data/analysis_data.csv")
