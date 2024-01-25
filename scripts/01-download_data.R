#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto 
# Author: faralk
# Date: 25 January 2024
# Contact: 156137245+faralk@users.noreply.github.com
# License: MIT
# Pre-requisites: -

#### Install Packages ####
# Please uncomment lines 13 and 14 to install the packages
# opendatatoronto and tidyverse, respectively, if you have not done so already.

# install.packages("opendatatoronto")
# install.packages("tidyverse")

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####

## Download library branch data ##

library_branch_general_information <-
  # https://open.toronto.ca/dataset/library-branch-general-information/
  list_package_resources("f5aa9b07-da35-45e6-b31f-d6790eb9bd9b") |>
  filter(name == 
           "tpl-branch-general-information-2023.csv") |>
  # Having reduced the dataset to one row we can get the resource
  get_resource()

## Download library workstation data ##

library_workstation_usage_2012_2017 <-
  # https://open.toronto.ca/dataset/library-workstation-usage/
  list_package_resources("c5e2fdc6-9190-4205-bc04-0c3ce265d005") |>
  filter(name == 
           "tpl-workstation-usage-annual-by-branch-2012-2017.csv") |>
  get_resource()

library_workstation_usage_2018_2022 <-
  # https://open.toronto.ca/dataset/library-workstation-usage/
  list_package_resources("c5e2fdc6-9190-4205-bc04-0c3ce265d005") |>
  filter(name == 
           "tpl-workstation-usage-annual-by-branch-2018-2022.csv") |>
  get_resource()

#### Save data ####
write_csv(library_branch_general_information, "raw_branch_data.csv") 
write_csv(library_workstation_usage_2012_2017, "raw_annual_workstation_usage_2012-2017_data.csv") 
write_csv(library_workstation_usage_2018_2022, "raw_annual_workstation_usage_2018-2022_data.csv") 

         
