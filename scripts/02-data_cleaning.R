#### Preamble ####
# Purpose: Cleans and combines the raw library branch general information and library workstation usage data sets
# Author: faralk
# Date: 25 January 2024
# Contact: 156137245+faralk@users.noreply.github.com
# License: MIT
# Pre-requisites: 01-download-data.R

#### Install Packages ####
# Please uncomment line 13 to install the janitor package,
# if you have not done so already

# install.packages("janitor")

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(lubridate)

#### Clean data ####

## Merge Library Workstation Files ##

library_workstation_usage_2012_2017 <- 
  read_csv("inputs/data/raw_annual_workstation_usage_2012-2017_data.csv")
library_workstation_usage_2018_2022 <- 
  read_csv("inputs/data/raw_annual_workstation_usage_2018-2022_data.csv")

# https://stackoverflow.com/questions/20081256/combine-two-data-frames-with-the-same-column-names

library_workstation_usage_2012_2022 <- 
  rbind(library_workstation_usage_2012_2017, 
        library_workstation_usage_2018_2022)

## Clean Library Workstation Files ##

cleaned_library_workstation_usage_2012_2022 <- 
  library_workstation_usage_2012_2022 |>
  janitor::clean_names() |>
  # The ID is arbitrary and thus, we will select all other columns
  select(-x_id)

## Clean Library Branch General Information ##

library_branch_general_information <- 
  read_csv("inputs/data/raw_branch_data.csv")

cleaned_library_branch_general_information <-
  library_branch_general_information |>
  filter(PhysicalBranch==1) |>
  janitor::clean_names() |>
  select(branch_code, branch_name)

## Create the final dataset

cleaned_data <- 
  merge(cleaned_library_workstation_usage_2012_2022, 
        cleaned_library_branch_general_information, 
        by="branch_code", 
        all = FALSE) |>
  # The branch code is not commonly recognized and thus, we use the 
  # branch name to identify the branch instead
  select(-branch_code) 

#### Save data ####
write_csv(cleaned_library_workstation_usage_2012_2022, "cleaned_annual_workstation_usage_2012-2022.csv")
write_csv(cleaned_library_branch_general_information, "cleaned_branch_data.csv")
write_csv(cleaned_data, "analysis_data.csv")
