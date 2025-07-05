# src/_setup.R
library(tidyverse)
library(here)
library(fs)

# Configure here to recognize project root 
here::i_am("src/_setup.R")  

# Define key paths
DATA_DIR    <- here("private")
OUTPUT_DIR  <- here("output")
COMPS_DIR   <- here("src/components")


# Safe data loading function
load_private_data <- function() {
  if(file_exists(here("private/sensitive_data.csv"))) {
    read_csv(here("private/sensitive_data.csv")) %>%
      select(-ssn, -email)  # Remove sensitive columns
  } else {
    message("Private data not found - using sample data")
    tibble(id = 1:10, value = rnorm(10))
  }
}

#