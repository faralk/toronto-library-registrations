#### Preamble ####
# Purpose: Simulates the dataset representing Toronto Public Library workstation usage from 2012 to 2022
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
library(tidyverse)

#### Simulate data ####
set.seed(853)

simulated_workstation_data <- 
  tibble(
    branches = rep(paste("branch_", 1:100), each = 11),
    # Create 100 different library branches, suffixed by a unique number 1 through 100
    # Based on Christopher DuBois https://stackoverflow.com/a/1439843    
    year = rep(x = 2012:2022, times = 100), 
    usage = sample(x = 1:120000, size = 100 * 11))

head(simulated_workstation_data)
