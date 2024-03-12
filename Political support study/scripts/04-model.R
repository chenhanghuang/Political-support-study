#### Preamble ####
# Purpose: Models logit model 
# Author: Chenhang Huang,Zixuan Yang
# Date: 02 Mar 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: Uoft
# Pre-requisites: no



#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

analysis_data <- analysis_data |> mutate(vote_Biden = if_else(voted_for == "Biden", 1 , 0),
                                          vote_Biden = as_factor(voted_for),
                                          gender = as_factor(gender),
                                          education = as_factor(education),
                                          white = as_factor(white)
                                          )


### Model data ####
political_preferences <-
  stan_glm(
    vote_Biden ~ gender + education + age + white,
    data = analysis_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = 
      normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 853
  )

saveRDS(
  political_preferences,
  file = "political_preferences.rds"
)
