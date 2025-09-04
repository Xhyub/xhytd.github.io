# src/_setup.R
# -------------------------------------------------------------------
# PACKAGE INSTALLATION & LOADING

# 1. Define required packages
required_packages <- c(
  "config",     # YAML loading
  "yaml",       # Config loading
  "here",       # Path management
  "dplyr",      # Data manipulation
  "logger",     # Logging
  "purrr",      # Functional programming
  "jsonlite",   # JSON handling (for data files)
  "tidyverse",  # Data visualization
  "fs"          # File system operations
)

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

# 2. Install missing packages
install_missing_packages <- function(packages) {
  missing_packages <- setdiff(packages, installed.packages()[, "Package"])
  if (length(missing_packages) > 0) {
    message("Installing missing packages: ",
            paste(missing_packages, collapse = ", "))
    install.packages(missing_packages, repos = "https://cloud.r-project.org")
  }
}


# 3. Load all packages safely
load_packages_safely <- function(packages) {
  suppressPackageStartupMessages({
    for (pkg in packages) {
      if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
        stop("Failed to load package: ", pkg)
      }
    }
  })
}


# 4. Safe data loading function
load_private_data <- function() {
  if (file_exists(here("private/sensitive_data.csv"))) {
    read_csv(here("private/sensitive_data.csv")) %>%
      select(-ssn, -email)  # Remove sensitive columns
  } else {
    message("Private data not found - using sample data")
    tibble(id = 1:10, value = rnorm(10))
  }
}

# 5. Write a basic function to test source() in build.R
my_basic_func <- function() {
  cat("my_basic_func() called!\n\n")
}


# 6. Execute setup
cat("Checking package dependencies...\n")
install_missing_packages(required_packages)
load_packages_safely(required_packages)

load_private_data()
my_basic_func()

cat("All packages loaded successfully.\n")

# Configure here to recognize project root
here::i_am("src/_setup.R")

