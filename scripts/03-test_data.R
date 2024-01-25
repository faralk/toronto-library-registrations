#### Preamble ####
# Purpose: Tests the cleaned data set (or the simulated one).
# Author: faralk
# Date: 25 January 2024
# Contact: 156137245+faralk@users.noreply.github.com
# License: MIT
# Pre-requisites: 00-simulate_data.R or 02-data-cleaning.R


#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Test data ####

test_data <- 
  read_csv("output/data/analysis_data.csv")

all(test_data$year |> unique() == c(2012:2022))
test_data$sessions |> max() <= 200000
test_data$sessions |> min() >= 0
n_distinct(test_data$branch_name) == 100