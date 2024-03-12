#### Preamble ####
# Purpose: Replicated graphs 
# Author: Chenhang Huang, Zixuan Yang
# Date: 02 Mar 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: UOT
# Pre-requisites:No
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
library(readr)
library(gridExtra)
library(modelsummary)



#### summary regression model 

political_preferences <- readRDS(here::here("political_preferences.rds"))


modelsummary(
  list(
    "Support Biden" = political_preferences
  ),
  statistic = "mad"
)

#### Figure 1. z-Statistics in 25 Top Economics Journals

modelplot(political_preferences, conf_level = 0.9) +
  labs(x = "90 per cent credibility interval")

