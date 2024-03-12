#### Preamble ####
# Purpose: Simulates the data frame I will collect in my paper 
# Author: Chenhang Huang, Zixuan Yang
# Date: 2 Mar 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: UOT
# Pre-requisites: no


#### Workspace setup ####
library(tidyverse)

set.seed(853)

num_obs <- 1000

us_political_preferences <- tibble(
  education = sample(1:6, size = num_obs, replace = TRUE),
  gender = sample(0:1, size = num_obs, replace = TRUE),
  age = runif(num_obs,18,80),
  race = sample(0:1, size = num_obs, replace = TRUE),
  support_prob = ((education + gender + race + age/80) / 9),
  
) |>
  mutate(
    supports_biden = if_else(runif(n = num_obs) < support_prob, "yes", "no"),
    education = case_when(
      education == 1 ~ "No HS",
      education == 2 ~ "High school graduate",
      education == 3 ~ "Some college",
      education == 4 ~ "2-year",
      education == 5 ~ "4-year",
      education == 6 ~ "Post-grad"
    ),
    gender = if_else(gender == 0, "Male", "Female"),
    white = if_else(race == 0, "No", "Yes"),
  ) |>
  select(-support_prob, -race, supports_biden,  gender, education,age,white)